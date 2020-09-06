import 'dart:math';

double randomBetween(double start, double end) =>
    Random().nextDouble() * (end - start) + start;
