import 'package:flutter/material.dart';

class TextEllipsis extends StatelessWidget {
  final String text;
  final TextStyle style;

  TextEllipsis({
    Key key,
    @required this.text,
    this.style,
  }) : super(key: key);

  addWhiteSpace(text) {
    return text.replaceAll("", "\u{200B}");
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      addWhiteSpace(text),
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
