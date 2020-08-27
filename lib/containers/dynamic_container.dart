import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/ux.dart';

class DynamicContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  DynamicContainer({
    Key key,
    @required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Connector.state(
      converter: resolvedDominantColor,
      builder: (context, backgroundColor) {
        return AnimatedContainer(
          width: width,
          height: height,
          duration: UX.transitionDuration,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: child,
        );
      },
    );
  }
}
