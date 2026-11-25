package jpamb.cases;

import static jpamb.utils.Tag.TagType.*;

import jpamb.utils.Case;
import jpamb.utils.Tag;

/**
 * Integer guards in five patterns: guarded division, range checks before array access, branches
 * that an analysis can settle, assertions on facts established by an earlier branch, and else-if
 * chains whose result is used after the merge.
 */
public class Guards {

  // --- guarded division ------------------------------------------------------

  @Case("(5) -> ok")
  @Case("(0) -> ok")
  @Tag({CONDITIONAL})
  public static int divGuardNotZero(int d) {
    if (d != 0) {
      return 100 / d;
    }
    return 0;
  }

  @Case("(3) -> ok")
  @Case("(-3) -> ok")
  @Tag({CONDITIONAL})
  public static int divGuardPositiveReversed(int d) {
    if (0 < d) {
      return 100 / d;
    }
    return -1;
  }

  @Case("(0) -> divide by zero")
  @Case("(1) -> ok")
  @Tag({CONDITIONAL})
  public static int divGuardWrongBound(int d) {
    if (d >= 0) {
      return 100 / d;
    }
    return 0;
  }

  // --- range check before array access --------------------------------------

  @Case("(2) -> ok")
  @Case("(7) -> ok")
  @Tag({CONDITIONAL, ARRAY})
  public static int rangeCheckedRead(int i) {
    int[] a = {3, 1, 4, 1, 5};
    if (i >= 0 && i < a.length) {
      return a[i];
    }
    return -1;
  }

  @Case("(5) -> out of bounds")
  @Case("(0) -> ok")
  @Tag({CONDITIONAL, ARRAY})
  public static int rangeCheckOffByOne(int i) {
    int[] a = {3, 1, 4, 1, 5};
    if (i >= 0 && i <= a.length) {
      return a[i];
    }
    return -1;
  }

  @Case("(-1) -> out of bounds")
  @Case("(1) -> ok")
  @Tag({CONDITIONAL, ARRAY})
  public static int rangeCheckLowerMissing(int i) {
    int[] a = {3, 1, 4, 1, 5};
    if (i < a.length) {
      return a[i];
    }
    return -1;
  }

  // --- branches the analysis can settle -------------------------------------

  @Case("(0) -> ok")
  @Case("(7) -> ok")
  @Tag({CONDITIONAL})
  public static int clampThenDivide(int x) {
    if (x < 1) {
      x = 1;
    }
    if (x > 0) {
      return 100 / x;
    }
    return 0;
  }

  @Case("(3) -> ok")
  @Tag({CONDITIONAL})
  public static int constantMode(int x) {
    int mode = 2;
    if (mode == 2) {
      return x + 1;
    }
    return 100 / (mode - 2);
  }

  @Case("(1) -> ok")
  @Tag({CONDITIONAL, LOOP})
  public static int boundedLoopCheck(int x) {
    int s = 0;
    for (int i = 0; i < 10; i++) {
      if (i < 20) {
        s += x;
      } else {
        assert false;
      }
    }
    return s;
  }

  // --- assertions on derived facts ------------------------------------------

  @Case("(6) -> ok")
  @Case("(0) -> ok")
  @Tag({CONDITIONAL})
  public static int assertAfterGuard(int x) {
    if (x > 5) {
      assert x != 0;
      return 1;
    }
    return 0;
  }

  @Case("(1, 2) -> ok")
  @Case("(2, 1) -> ok")
  @Tag({CONDITIONAL})
  public static void assertDerivedRange(int x, int y) {
    if (x >= 0 && y > x) {
      assert y > 0;
    }
  }

  @Case("(-1) -> assertion error")
  @Case("(3) -> ok")
  @Tag({CONDITIONAL})
  public static void assertWrongDerivation(int x) {
    if (x >= -1) {
      assert x >= 0;
    }
  }

  // --- else-if chains, used after the merge ---------------------------------

  @Case("(-4) -> ok")
  @Case("(0) -> ok")
  @Case("(4) -> ok")
  @Tag({CONDITIONAL})
  public static int signThenDivide(int x) {
    int s;
    if (x < 0) {
      s = -1;
    } else if (x == 0) {
      s = 1;
    } else {
      s = 2;
    }
    return 10 / s;
  }

  @Case("(5) -> ok")
  @Case("(15) -> ok")
  @Case("(25) -> ok")
  @Tag({CONDITIONAL, ARRAY})
  public static int classifyThenIndex(int x) {
    int[] t = {10, 20, 30};
    int k;
    if (x < 10) {
      k = 0;
    } else if (x < 20) {
      k = 1;
    } else {
      k = 2;
    }
    return t[k];
  }

  @Case("(0) -> divide by zero")
  @Case("(3) -> ok")
  @Case("(-3) -> ok")
  @Tag({CONDITIONAL})
  public static int mergeLosesZero(int x) {
    int d;
    if (x > 0) {
      d = x;
    } else {
      d = -x;
    }
    return 100 / d;
  }
}
