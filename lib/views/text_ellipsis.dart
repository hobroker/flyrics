import 'package:flutter/material.dart';

class TextEllipsis extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;

  TextEllipsis({
    Key key,
    @required this.text,
    this.style,
    this.maxLines = 1,
  }) : super(key: key);

  String addWhiteSpaces(text) {
    return text.replaceAll('', '\u{200B}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: style.fontSize * maxLines,
      child: Text(
        addWhiteSpaces(text),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: style.copyWith(height: 1),
      ),
    );
  }
}
