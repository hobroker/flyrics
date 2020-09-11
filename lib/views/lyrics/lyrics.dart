import 'package:flutter/material.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/track_store.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:flyrics/utils/o.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_screen.dart';

class Lyrics extends StatelessWidget {
  final _track = I<TrackStore>();

  @override
  Widget build(BuildContext context) {
    return O.branch(
      () => isNull(_track.lyrics.text),
      () => LyricsPlaceholder(),
      () => LyricsScreen(),
    );
  }
}
