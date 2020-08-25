import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flyrics/utils/sizing.dart';

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
    var ui = UI(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Opacity(
        opacity: .5,
        child: IconButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(
            maxWidth: ui.geniusIconSize,
            maxHeight: ui.geniusIconSize,
          ),
          icon: SvgPicture.asset(UI.geniusIcon, color: UI.geniusAccentColor),
          onPressed: openUrl,
        ),
      ),
    );
  }
}
