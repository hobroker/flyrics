import 'package:flutter/material.dart';
import 'package:flyrics/utils/ux.dart';
import 'package:flyrics/views/hover_builder.dart';
import 'package:flyrics/views/icons/genius_icon.dart';

class GeniusRedirectScreen extends StatelessWidget {
  final Color iconColor;
  final Function() openUrl;

  GeniusRedirectScreen({
    Key key,
    @required this.openUrl,
    @required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverBuilder<double>(
      value: 0.5,
      onEnter: (double opacity) => 1.0,
      builder: (BuildContext context, double opacity) {
        return AnimatedOpacity(
          opacity: opacity,
          duration: UX.transitionDuration,
          child: IconButton(
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxWidth: 20,
              maxHeight: 20,
            ),
            icon: GeniusIcon(),
            onPressed: openUrl,
          ),
        );
      },
    );
  }
}
