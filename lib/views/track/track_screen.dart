import 'package:flutter/material.dart';
import 'package:flyrics/utils/ux.dart';
import 'package:flyrics/views/text_ellipsis.dart';
import 'package:flyrics/views/track/track_name.dart';

class TrackScreen extends StatelessWidget {
  final String name;
  final String artist;
  final Color textColor;

  TrackScreen({
    Key key,
    @required this.name,
    @required this.artist,
    this.textColor,
  }) : super(key: key);

  TextStyle get _textStyle => TextStyle(color: textColor);

  TextStyle get _artistTextStyle => _textStyle.copyWith(fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: TrackName(
            name: name,
            textColor: textColor,
          ),
        ),
        SizedBox(height: UX.spacingUnit),
        TextEllipsis(
          text: artist,
          style: _artistTextStyle,
        ),
      ],
    );
  }
}
