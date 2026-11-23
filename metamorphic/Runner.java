import java.io.*;
import java.lang.reflect.*;
import java.util.concurrent.*;

/** Usage: java -ea Runner <class> <method>; reads lines of int args from stdin. */
public class Runner {
  public static void main(String[] a) throws Exception {
    Class<?> c = Class.forName(a[0]);
    Method found = null;
    for (Method x : c.getDeclaredMethods()) if (x.getName().equals(a[1])) found = x;
    final Method m = found;
    ExecutorService ex = Executors.newCachedThreadPool(r -> {
      Thread t = new Thread(r);
      t.setDaemon(true);
      return t;
    });
    BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
    String line;
    while ((line = in.readLine()) != null) {
      String[] p = line.isBlank() ? new String[0] : line.trim().split(" ");
      final Object[] args = new Object[p.length];
      for (int i = 0; i < p.length; i++) args[i] = Integer.parseInt(p[i]);
      Future<String> f = ex.submit(() -> {
        try {
          Object r = m.invoke(null, args);
          return "ok:" + r;
        } catch (InvocationTargetException e) {
          Throwable t = e.getCause();
          if (t instanceof ArithmeticException) return "divide by zero";
          if (t instanceof AssertionError) return "assertion error";
          if (t instanceof ArrayIndexOutOfBoundsException) return "out of bounds";
          if (t instanceof NullPointerException) return "null pointer";
          return t.getClass().getSimpleName();
        }
      });
      String out;
      try {
        out = f.get(2, TimeUnit.SECONDS);
      } catch (TimeoutException e) {
        out = "timeout";
        f.cancel(true);
      }
      System.out.println(line + " => " + out);
    }
    System.exit(0);
  }
}