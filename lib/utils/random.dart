import 'dart:math';

double randomDoubleBetween(double start, double end) =>
    Random().nextDouble() * (end - start) + start;
