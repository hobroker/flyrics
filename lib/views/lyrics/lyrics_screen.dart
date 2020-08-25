import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

class LyricsScreen extends StatelessWidget {
  final Color textColor;
  final String text;

  LyricsScreen({
    Key key,
    @required this.textColor,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SelectableText(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: UI(context).lyricsFontSize,
          color: textColor,
        ),
      ),
    );
  }
}
