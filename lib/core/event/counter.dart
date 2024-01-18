class Counter {
  static int increment(int value) => value + 1;

  static int decrement(int value) {
    if (value > 1) {
      return value - 1;
    } else {
      return 1;
    }
  }
}
