import 'package:flutter/material.dart';

class HoverBuilder<Value> extends StatefulWidget {
  final Value value;
  final Function(Value) onEnter;
  final Function(Value) onExit;
  final Function(BuildContext, Value) builder;

  HoverBuilder({
    Key key,
    @required this.value,
    @required this.onEnter,
    this.onExit,
    @required this.builder,
  }) : super(key: key);

  @override
  _HoverBuilderState<Value> createState() => _HoverBuilderState<Value>();
}

class _HoverBuilderState<Value> extends State<HoverBuilder<Value>> {
  Value init;
  Value state;

  @override
  void initState() {
    super.initState();
    init = widget.value;
    state = init;
  }

  void _onExit(event) {
    setState(() {
      if (widget.onExit == null) {
        state = init;
      } else {
        state = widget.onExit(state);
      }
    });
  }

  void _onEnter(event) {
    setState(() => state = widget.onEnter(state));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: widget.builder(context, state),
      onEnter: _onEnter,
      onExit: _onExit,
    );
  }
}
