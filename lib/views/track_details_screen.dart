import 'package:flutter/material.dart';
import 'package:flyrics/models/track.dart';

class TrackDetailsScreen extends StatelessWidget {
  final Track track;

  TrackDetailsScreen({
    Key key,
    @required this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.track.name),
        Text(this.track.artist),
      ],
    );
  }
}
