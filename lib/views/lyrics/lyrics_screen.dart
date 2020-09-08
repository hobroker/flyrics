import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/store.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';

class LyricsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = useSelector(resolveArtworkTextColor);
    final text = useSelector(getLyricsText);

    return Container(
      child: SelectableText(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12,
          color: textColor,
          height: 1.3,
        ),
      ),
    );
  }
}
