import 'package:flutter/material.dart';
import 'package:flyrics/containers/dynamic_tooltip.dart';
import 'package:flyrics/utils/ux.dart';
import 'package:flyrics/views/hover_builder.dart';
import 'package:flyrics/views/icons/genius_icon.dart';

class GeniusRedirectScreen extends StatelessWidget {
  final Color iconColor;
  final Function() openUrl;

  const GeniusRedirectScreen({
    Key key,
    @required this.openUrl,
    @required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var height = constraints.maxHeight;

      return DynamicTooltip(
        message: 'Open in browser',
        child: HoverBuilder<double>(
          value: 0.5,
          onEnter: (double opacity) => 1.0,
          builder: (BuildContext context, double opacity) {
            return AnimatedOpacity(
              opacity: opacity,
              duration: UX.transitionDuration,
              child: IconButton(
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(
                  maxWidth: height,
                  maxHeight: height,
                ),
                icon: GeniusIcon(),
                onPressed: openUrl,
              ),
            );
          },
        ),
      );
    });
  }
}
