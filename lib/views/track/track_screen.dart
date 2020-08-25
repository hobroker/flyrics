import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/text_ellipsis.dart';

class TrackScreen extends StatelessWidget {
  final String name;
  final String artist;
  final Color textColor;
  final double headerHeight;

  TrackScreen({
    Key key,
    @required this.name,
    @required this.artist,
    @required this.headerHeight,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: textColor ?? UI.textColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextEllipsis(
          text: name,
          style: textStyle.copyWith(
            fontSize: relativeSize(headerHeight, .25, max: 19, min: 16),
            fontWeight: FontWeight.w500,
          ),
        ),
        TextEllipsis(
          text: artist,
          style: textStyle.copyWith(
            fontSize: relativeSize(headerHeight, .22, max: 18, min: 14),
          ),
        ),
      ],
    );
  }
}
