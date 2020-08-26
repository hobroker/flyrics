import 'package:flutter/material.dart';
import 'package:flyrics/utils/painter.dart';
import 'package:flyrics/utils/ux.dart';
import 'package:flyrics/views/text_ellipsis.dart';

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

  TextStyle get _textStyle => TextStyle(color: textColor ?? UX.textColor);

  TextStyle get _nameTextStyle =>
      _textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get _artistTextStyle => _textStyle.copyWith(fontSize: 15);

  double _getNameAvailableHeight(constraints) => constraints.maxHeight - 21.0;

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
        var nameAvailableHeight = _getNameAvailableHeight(constraints);
        var nameMaxLines = _getNameMaxLines(constraints);
        if (nameMaxLines == 2 && nameAvailableHeight < 30) {
          nameMaxLines = 1;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextEllipsis(
              text: name,
              maxLines: nameMaxLines,
              style: _nameTextStyle,
            ),
            SizedBox(height: 4),
            TextEllipsis(
              text: artist,
              style: _artistTextStyle,
            ),
          ],
        );
      },
    );
  }
}
