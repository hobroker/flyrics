import 'package:flutter/material.dart';
import 'package:flyrics/utils/painter.dart';
import 'package:flyrics/views/text_ellipsis.dart';

class TrackName extends StatelessWidget {
  final String name;
  final Color textColor;

  TrackName({
    Key key,
    @required this.name,
    this.textColor,
  }) : super(key: key);

  TextStyle get _textStyle => TextStyle(color: textColor);

  TextStyle get _nameTextStyle =>
      _textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  int _getNameMaxLines(constraints) {
    var textPainter = paintText(
      name,
      _nameTextStyle,
      constraints,
      maxLines: 1,
    );

    return textPainter.didExceedMaxLines ? 2 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var nameMaxLines = _getNameMaxLines(constraints);
        if (nameMaxLines == 2 &&
            constraints.maxHeight < _nameTextStyle.fontSize * 2) {
          nameMaxLines = 1;
        }

        return TextEllipsis(
          text: name,
          maxLines: nameMaxLines,
          style: _nameTextStyle,
        );
      },
    );
  }
}
