import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class LyricsScreen extends HookWidget {
  TextStyle get lyricsTextStyle => TextStyle(
        fontSize: 12,
        height: 1.3,
      );

  @override
  Widget build(BuildContext context) {
    final ux = useUX();
    final lyrics = useLyricsStore();

    return Container(
      child: O(
        () => SelectableText(
          lyrics.text,
          textAlign: TextAlign.start,
          style: lyricsTextStyle.copyWith(color: ux.textColor),
        ),
      ),
    );
  }
}
