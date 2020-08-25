import 'package:flutter/material.dart';

class TrackDetailsScreen extends StatelessWidget {
  final String name;
  final String artist;

  TrackDetailsScreen({
    Key key,
    @required this.name,
    @required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.name,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            this.artist,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
