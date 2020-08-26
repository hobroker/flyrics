double relativeSize(double main, double percent, {double max, double min}) {
  var result = main * percent;
  if (min != null && result < min) {
    return min;
  }
  if (max != null && result > max) {
    return max;
  }

  return result;
}
