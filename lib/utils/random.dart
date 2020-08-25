import 'dart:math';

int random(min, max) {
  var random = new Random();

  return min + random.nextInt(max - min);
}
