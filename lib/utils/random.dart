import 'dart:math';

int random(min, max) {
  var random = new Random();

  return min + random.nextInt(max - min);
}

randomSize(double maxWidth, {subPercent: 0.1}) {
  var sub = maxWidth * subPercent;

  return random((maxWidth - sub).toInt(), maxWidth.toInt()).toDouble();
}
