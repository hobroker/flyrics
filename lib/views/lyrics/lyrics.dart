import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_screen.dart';

class Lyrics extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _lyrics = useLyricsStore();

    return O.branch(
      () => isNull(_lyrics.text),
      () => LyricsPlaceholder(),
      () => LyricsScreen(),
    );
  }
}
