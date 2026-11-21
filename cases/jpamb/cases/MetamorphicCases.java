package jpamb.cases;

import jpamb.utils.Case;

/**
 * Cases written for metamorphic testing of static analyzers. Every method is the ORIGINAL form; a
 * rewrite tool produces the variants. Each method guards a risky operation (division, array
 * access, assert) behind an integer comparison, so the analyzer must narrow at the branch to
 * prove it safe. All guards are correct, so every method is expected to be safe for the inputs
 * listed, and the boundary inputs sit right at the comparison.
 */
public class MetamorphicCases {

  // x > 0 guard, division inside the branch
  @Case("(-1) -> ok")
  @Case("(0) -> ok")
  @Case("(1) -> ok")
  @Case("(100) -> ok")
  public static int guardGreater(int x) {
    if (x > 0) {
      return 100 / x;
    }
    return 0;
  }

  // x >= 1 guard
  @Case("(0) -> ok")
  @Case("(1) -> ok")
  @Case("(-5) -> ok")
  public static int guardGreaterEq(int x) {
    if (x >= 1) {
      return 100 / x;
    }
    return 0;
  }

  // x < 0 guard, divisor is the negative side
  @Case("(-1) -> ok")
  @Case("(0) -> ok")
  @Case("(1) -> ok")
  public static int guardLess(int x) {
    if (x < 0) {
      return 100 / x;
    }
    return 0;
  }

  // x <= -1 guard
  @Case("(-1) -> ok")
  @Case("(0) -> ok")
  @Case("(7) -> ok")
  public static int guardLessEq(int x) {
    if (x <= -1) {
      return 100 / x;
    }
    return 0;
  }

  // early return: the division sits AFTER the branch (control flow merges differently)
  @Case("(0) -> ok")
  @Case("(1) -> ok")
  @Case("(-3) -> ok")
  public static int earlyReturnZero(int x) {
    if (x == 0) {
      return 0;
    }
    return 100 / x;
  }

  // != guard
  @Case("(0) -> ok")
  @Case("(4) -> ok")
  public static int guardNotEqual(int x) {
    if (x != 0) {
      return 100 / x;
    }
    return 0;
  }

  // early return with <= (the example from the project description)
  @Case("(0) -> ok")
  @Case("(-1) -> ok")
  @Case("(2) -> ok")
  public static int earlyReturnNonPositive(int x) {
    if (x <= 0) {
      return 0;
    }
    return 100 / x;
  }

  // two guards, both needed for safety
  @Case("(0, 5) -> ok")
  @Case("(3, 0) -> ok")
  @Case("(3, 3) -> ok")
  @Case("(-1, -1) -> ok")
  public static int twoGuards(int a, int b) {
    if (a > 0) {
      if (b > 0) {
        return 100 / (a * b);
      }
    }
    return 0;
  }

  // branches merge, then the division happens: precision depends on where the join is
  @Case("(0) -> ok")
  @Case("(5) -> ok")
  @Case("(-5) -> ok")
  public static int mergeThenDivide(int x) {
    int d;
    if (x > 0) {
      d = x;
    } else {
      d = 1;
    }
    return 100 / d;
  }

  // abs-like normalisation, then a guarded division
  @Case("(0) -> ok")
  @Case("(-4) -> ok")
  @Case("(4) -> ok")
  public static int absThenDivide(int x) {
    int y = x;
    if (y < 0) {
      y = -y;
    }
    if (y > 0) {
      return 100 / y;
    }
    return 0;
  }

  // array index guarded by two comparisons
  @Case("(0) -> ok")
  @Case("(2) -> ok")
  @Case("(3) -> ok")
  @Case("(-1) -> ok")
  public static int guardIndex(int i) {
    int[] a = {10, 20, 30};
    if (i >= 0) {
      if (i < 3) {
        return a[i];
      }
    }
    return -1;
  }

  // assert that holds because of the branch
  @Case("(0) -> ok")
  @Case("(9) -> ok")
  @Case("(-9) -> ok")
  public static void guardAssert(int x) {
    if (x > 0) {
      assert x >= 1;
    }
  }

  // loop with a guarded division in the body
  @Case("(0) -> ok")
  @Case("(3) -> ok")
  public static int loopGuard(int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
      if (i > 0) {
        sum += 100 / i;
      }
    }
    return sum;
  }

  // BUG on purpose: guard is off by one, so x == 0 reaches the division
  @Case("(1) -> ok")
  @Case("(0) -> divide by zero")
  public static int offByOneGuard(int x) {
    if (x >= 0) {
      return 100 / x;
    }
    return 0;
  }
}