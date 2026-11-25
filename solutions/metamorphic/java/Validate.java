import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Runs one benchmark method in several versions (original and variants) on a list of inputs.
 *
 * <p>Usage: {@code Validate METHODID BASE VERSIONS INPUTS START_VERSION START_INPUT TIMEOUT_MS}.
 * VERSIONS has one class directory per line; each version is loaded by its own class loader over
 * {@code [dir, BASE]}, so the version's case class wins and the jpamb runtime classes are shared
 * within that loader. Prints {@code version<TAB>input<TAB>result} per run, where result is {@code
 * ok:<return value>}, an outcome name, {@code *} (timeout) or {@code exception:<class>}. A
 * timed-out run cannot be stopped, so the harness exits with code 3 after it; the caller restarts
 * from the next run.
 */
public class Validate {
  static final Pattern ID = Pattern.compile("(.*)\\.([^.(]*):\\((.*)\\)(.*)");

  static String render(Object r) {
    if (r instanceof int[] a) return Arrays.toString(a);
    if (r instanceof char[] a) return Arrays.toString(a);
    return String.valueOf(r);
  }

  public static void main(String[] a) throws Exception {
    Matcher id = ID.matcher(a[0]);
    if (!id.find()) throw new IllegalArgumentException(a[0]);
    URL base = Path.of(a[1]).toUri().toURL();
    List<String> versions = Files.readAllLines(Path.of(a[2]));
    List<String> inputs = Files.readAllLines(Path.of(a[3]));
    int startVersion = Integer.parseInt(a[4]);
    int startInput = Integer.parseInt(a[5]);
    long timeout = Long.parseLong(a[6]);

    for (int v = startVersion; v < versions.size(); v++) {
      URL dir = Path.of(versions.get(v)).toUri().toURL();
      URLClassLoader loader =
          new URLClassLoader(new URL[] {dir, base}, ClassLoader.getPlatformClassLoader());
      loader.setDefaultAssertionStatus(true);
      Method sig = loader.loadClass("jpamb.Runtime").getMethod("parseMethodSignature", String.class);
      Class<?>[] params = (Class<?>[]) sig.invoke(null, id.group(3));
      Method m = loader.loadClass(id.group(1)).getMethod(id.group(2), params);
      Method parse = loader.loadClass("jpamb.utils.InputParser").getMethod("parse", String.class);
      Method outcome =
          loader
              .loadClass("jpamb.utils.CaseContent$ResultType")
              .getMethod("fromThrowable", Throwable.class);

      for (int i = (v == startVersion ? startInput : 0); i < inputs.size(); i++) {
        Object[] args = (Object[]) parse.invoke(null, inputs.get(i));
        FutureTask<String> task =
            new FutureTask<>(
                () -> {
                  try {
                    return "ok:" + render(m.invoke(null, args));
                  } catch (InvocationTargetException e) {
                    Throwable cause = e.getCause();
                    try {
                      return String.valueOf(outcome.invoke(null, cause));
                    } catch (InvocationTargetException unexpected) {
                      return "exception:" + cause.getClass().getName();
                    }
                  }
                });
        Thread t = new Thread(task);
        t.setDaemon(true);
        t.start();
        String result;
        try {
          result = task.get(timeout, TimeUnit.MILLISECONDS);
        } catch (TimeoutException e) {
          System.out.println(v + "\t" + i + "\t*");
          System.out.flush();
          System.exit(3);
          return;
        }
        System.out.println(v + "\t" + i + "\t" + result);
      }
    }
    System.out.flush();
    System.exit(0);
  }
}
