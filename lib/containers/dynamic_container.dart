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
      converter: getArtworkDominantColor,
      builder: (context, backgroundColor) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? UX.primaryColor,
          ),
          child: AnimatedContainer(
            duration: UX.transitionDuration,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
