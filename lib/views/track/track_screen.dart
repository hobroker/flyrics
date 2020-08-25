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

  TextStyle get textStyle => TextStyle(color: textColor ?? UX.textColor);

  TextStyle get nameTextStyle =>
      textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get artistTextStyle => textStyle.copyWith(fontSize: 15);

  double getNameAvailableHeight(constraints) => constraints.maxHeight - 18.0;

  int getNameMaxLines(constraints) {
    var textPainter = paintText(
      name,
      nameTextStyle,
      constraints,
      maxLines: 1,
    );
    var didExceedMaxLines = textPainter.didExceedMaxLines;
    var nameAvailableHeight = getNameAvailableHeight(constraints);

    return didExceedMaxLines && nameAvailableHeight > 35 ? 2 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var nameAvailableHeight = getNameAvailableHeight(constraints);
        var nameMaxLines = getNameMaxLines(constraints);
        var nameHeight = nameMaxLines == 2 ? nameAvailableHeight : 20.0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: nameHeight,
              child: Align(
                alignment: Alignment.topLeft,
                child: TextEllipsis(
                  text: name,
                  maxLines: nameMaxLines,
                  style: nameTextStyle,
                ),
              ),
            ),
            TextEllipsis(
              text: artist,
              style: artistTextStyle,
            ),
          ],
        );
      },
    );
  }
}
