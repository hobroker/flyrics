import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class ContentWrapper extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  ContentWrapper({
    Key key,
    @required this.child,
    @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = UI(context).appHeight - UI(context).headerHeight;

    return Expanded(
      child: AnimatedContainer(
        padding: EdgeInsets.all(8),
        alignment: Alignment(0, 0),
        duration: UI.transitionDuration,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height,
            minHeight: height,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
