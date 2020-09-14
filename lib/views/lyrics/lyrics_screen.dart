import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/containers/o.dart';
import 'package:flyrics/hooks/injections.dart';

class LyricsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _lyrics = useLyricsStore();
    final _color = useColorStore();

    return Container(
      child: O(
        () => SelectableText(
          _lyrics.text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            color: _color.textColor,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
