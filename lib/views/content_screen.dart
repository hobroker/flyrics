import 'package:flutter/material.dart';

class LyricsContent extends StatelessWidget {
  final Color textColor;
  final String text;

  LyricsContent({
    Key key,
    @required this.textColor,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 12,
        color: textColor,
      ),
    );
  }
}
