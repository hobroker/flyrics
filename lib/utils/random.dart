import 'dart:math';

double randomBetween(double start, double end) =>
    Random().nextDouble() * (end - start) + start;

double randomInRange(List<double> list) => randomBetween(list[0], list[1]);
