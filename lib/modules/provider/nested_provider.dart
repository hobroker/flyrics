import 'package:flutter/material.dart';
import 'package:flyrics/modules/provider/injection.dart';

class NestedProvider extends StatelessWidget {
  final List<PoviderFactory> factories;
  final Widget child;

  const NestedProvider({
    Key key,
    @required this.factories,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return factories.reversed.fold(child, (accWidget, factory) {
      return Provider(
        factories: [factory],
        child: accWidget,
      );
    });
  }
}
