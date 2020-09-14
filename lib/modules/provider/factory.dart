import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flyrics/modules/provider/injection.dart';

@immutable
class ProviderFactory {
  final PoviderFactory factory;
  final List<PoviderFactory> factories;
  final OnCreate onCreate;

  ProviderFactory({
    this.factory,
    this.factories,
    this.onCreate,
  });
}
