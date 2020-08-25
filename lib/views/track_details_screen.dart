import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/text_ellipsis.dart';

class TrackDetailsScreen extends StatelessWidget {
  final String name;
  final String artist;
  final Color textColor;

  TrackDetailsScreen({
    Key key,
    @required this.name,
    @required this.artist,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = new TextStyle(
      color: this.textColor ?? UI.textColor,
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextEllipsis(
            text: name,
            style: textStyle.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextEllipsis(
            text: artist,
            style: textStyle.copyWith(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
