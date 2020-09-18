import 'package:flutter/material.dart';
import 'package:jab/jab.dart';

typedef Get = T Function<T>();
typedef ProviderFactory<T extends Object> = T Function(Get get);

class Provider extends Jab {
  Provider({Widget child, Iterable<ProviderFactory> factories})
      : super(
          providers: () => factories,
          child: child,
        );
}
