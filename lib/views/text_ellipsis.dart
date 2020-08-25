import 'package:flutter/material.dart';

class TextEllipsis extends StatelessWidget {
  final String text;
  final TextStyle style;

  TextEllipsis({
    Key key,
    @required this.text,
    this.style,
  }) : super(key: key);

  String addWhiteSpaces(text) {
    return text.replaceAll('', '\u{200B}');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      addWhiteSpaces(text),
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
