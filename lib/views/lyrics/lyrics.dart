import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/hooks/translate.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/views/lyrics/lyrics_info_box.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_screen.dart';

class Lyrics extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final t = useI18n();
    final lyrics = useLyricsStore();

    return O.statusBranch(
      () => lyrics.status,
      placeholder: () => LyricsPlaceholder(animated: false),
      loading: () => LyricsPlaceholder(animated: true),
      error: () => LyricsInfoBox(text: t('lyrics.error')),
      empty: () => LyricsInfoBox(text: t('lyrics.no_results')),
      success: () => LyricsScreen(),
    );
  }
}
