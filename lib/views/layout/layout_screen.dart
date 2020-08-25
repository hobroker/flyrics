import 'package:flutter/material.dart';
import 'package:flyrics/containers/lyrics.dart';
import 'package:flyrics/views/lyrics/lyrics_wrapper.dart';
import 'package:flyrics/views/header/header.dart';

class LayoutScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        LyricsWrapper(
          child: Lyrics(),
        ),
      ],
    );
  }
}
