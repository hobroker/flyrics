import 'package:flutter/material.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track_store.dart';
import 'package:flyrics/utils/o.dart';

class LyricsScreen extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: O(
        () => SelectableText(
          _track.lyrics.text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            color: _track.artwork.textColor,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
