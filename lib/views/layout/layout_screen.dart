import 'package:flutter/material.dart';
import 'package:flyrics/containers/lyrics.dart';
import 'package:flyrics/views/footer.dart';
import 'package:flyrics/views/header/header.dart';
import 'package:flyrics/views/lyrics/lyrics_wrapper.dart';

class LayoutScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        LyricsWrapper(
          child: Lyrics(),
          footer: Footer(),
        ),
      ],
    );
  }
}
