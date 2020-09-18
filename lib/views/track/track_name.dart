import 'package:flutter/material.dart';
import 'package:flyrics/utils/painter.dart';
import 'package:marquee/marquee.dart';

class TrackName extends StatelessWidget {
  final String text;
  final Color textColor;

  TrackName({
    Key key,
    @required this.text,
    this.textColor,
  }) : super(key: key);

  TextStyle get _style => TextStyle(
        color: textColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );

  bool _fitsSingleLine(constraints) =>
      textFitsSingleLine(text: text, style: _style, constraints: constraints);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_fitsSingleLine(constraints)) {
          return Text(
            text,
            style: _style,
          );
        }

        return Marquee(
          text: text,
          style: _style,
          startAfter: Duration(seconds: 2),
          blankSpace: 50,
        );
      },
    );
  }
}
