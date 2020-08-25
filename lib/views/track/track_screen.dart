import 'package:flutter/material.dart';
import 'package:flyrics/utils/relative_size.dart';
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

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: textColor ?? UX.textColor,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.maxHeight;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextEllipsis(
              text: name,
              style: textStyle.copyWith(
                fontSize: relativeSize(height, .25, max: 19, min: 16),
                fontWeight: FontWeight.w500,
              ),
            ),
            TextEllipsis(
              text: artist,
              style: textStyle.copyWith(
                fontSize: relativeSize(height, .22, max: 18, min: 14),
              ),
            ),
          ],
        );
      },
    );
  }
}
