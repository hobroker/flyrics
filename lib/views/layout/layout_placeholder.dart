import 'package:flutter/material.dart';
import 'package:flyrics/views/header/header_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_wrapper.dart';

class LayoutPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LyricsWrapper(
      body: LyricsPlaceholder(
        isAnimated: false,
      ),
      header: HeaderPlaceholder(),
    );
  }
}
