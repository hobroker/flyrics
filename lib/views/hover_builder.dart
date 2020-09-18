import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HoverBuilder<T> extends HookWidget {
  final Function(T) onEnter;
  final Function(T) onExit;
  final Function(BuildContext, T) builder;
  final T initialState;
  final T toggleTo;

  HoverBuilder({
    Key key,
    @required this.initialState,
    @required this.builder,
    this.toggleTo,
    this.onEnter,
    this.onExit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useState<T>(initialState);

    return MouseRegion(
      child: builder(context, state.value),
      onEnter: (event) {
        if (onEnter == null) {
          state.value = state.value == toggleTo ? initialState : toggleTo;
        } else {
          state.value = onEnter(state.value);
        }
      },
      onExit: (event) {
        if (onExit == null) {
          state.value = initialState;
        } else {
          state.value = onExit(state.value);
        }
      },
    );
  }
}
