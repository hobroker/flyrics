import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/effect.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/views/footer.dart';
import 'package:flyrics/views/header.dart';
import 'package:flyrics/views/layout/layout_wrapper.dart';
import 'package:flyrics/views/lyrics/lyrics.dart';

class LayoutScreeen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _player = usePlayerStore();
    useEffectOnce(_player.start);

    return LayoutWrapper(
      header: Header(),
      body: Lyrics(),
      footer: Footer(),
    );
  }
}
