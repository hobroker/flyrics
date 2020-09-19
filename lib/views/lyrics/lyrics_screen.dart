import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/mobx/o.dart';

class LyricsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ux = useUX();
    final _lyrics = useLyricsStore();

    return Container(
      child: O(
        () => SelectableText(
          _lyrics.text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            color: ux.textColor,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
