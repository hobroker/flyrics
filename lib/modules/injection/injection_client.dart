import 'package:flutter/widgets.dart';
import 'package:flyrics/modules/injection/injection.dart';

typedef InjectionWidgetBuilder<T> = Widget Function(
    BuildContext context, T service);

class InjectionClient<T> extends StatefulWidget {
  const InjectionClient({
    Key key,
    @required this.builder,
  }) : super(key: key);

  final InjectionWidgetBuilder<T> builder;

  @override
  _InjectionClientState<T> createState() => _InjectionClientState<T>();
}

class _InjectionClientState<T> extends State<InjectionClient<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, Injection.get<T>(context));
  }
}
