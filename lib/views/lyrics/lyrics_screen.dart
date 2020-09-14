import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';

class LyricsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _track = useTrackStore();

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
