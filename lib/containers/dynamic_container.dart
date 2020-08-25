import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/sizing.dart';

class DynamicContainer extends StatelessWidget {
  final Widget child;

  DynamicContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: getArtworkDominantColor,
      builder: (context, backgroundColor) {
        return AnimatedContainer(
          duration: UI.transitionDuration,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: child,
        );
      },
    );
  }
}
