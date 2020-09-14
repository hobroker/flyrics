import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_screen.dart';

class Lyrics extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _player = usePlayerStore();
    final _lyrics = useLyricsStore();

    return O.branch(
      () => _player.areLyricsLoading || _lyrics.text == null,
      () => LyricsPlaceholder(),
      () => LyricsScreen(),
    );
  }
}
