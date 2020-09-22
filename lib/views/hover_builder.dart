import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HoverBuilder<T> extends HookWidget {
  final Function(T) onEnter;
  final Function(T) onExit;
  final Function(BuildContext, T) builder;
  final T initialState;

  HoverBuilder({
    Key key,
    @required this.initialState,
    @required this.builder,
    this.onEnter,
    this.onExit,
  }) : super(key: key);

  factory HoverBuilder.toggle({
    Key key,
    T initialState,
    T toggleTo,
    Function(BuildContext, T) builder,
  }) =>
      HoverBuilder(
        initialState: initialState,
        builder: builder,
        onEnter: (value) => toggleTo,
        onExit: (value) => initialState,
      );

  @override
  Widget build(BuildContext context) {
    final state = useState<T>(initialState);

    return MouseRegion(
      child: builder(context, state.value),
      onEnter: (event) => state.value = onEnter(state.value),
      onExit: (event) => state.value = onExit(state.value),
    );
  }
}
