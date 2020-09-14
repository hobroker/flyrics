import 'package:flutter/widgets.dart';
import 'package:flyrics/modules/injection/injection.dart';

class InjectionProvider<T> extends StatefulWidget {
  const InjectionProvider({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _InjectionProviderState<T> createState() => _InjectionProviderState<T>();
}

class _InjectionProviderState<T> extends State<InjectionProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return Injection(
      providers: () => [
        (injection) => Injection.of(context).getFactory<T>(),
      ],
    );
  }
}
