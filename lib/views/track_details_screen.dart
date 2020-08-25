import 'package:flutter/material.dart';
import 'package:flyrics/utils/sizing.dart';

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
          Text(
            this.name,
            overflow: TextOverflow.ellipsis,
            style: textStyle.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            this.artist,
            overflow: TextOverflow.ellipsis,
            style: textStyle.copyWith(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
