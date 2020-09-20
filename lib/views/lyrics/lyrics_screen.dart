import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class LyricsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ux = useUX();
    final lyrics = useLyricsStore();

    return Container(
      child: O(
        () => SelectableText(
          lyrics.text,
          textAlign: TextAlign.start,
          style: ux.body.lyricsTextStyle.copyWith(color: ux.textColor),
        ),
      ),
    );
  }
}
