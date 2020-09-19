import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flyrics/modules/mobx/o.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/hooks/translate.dart';
import 'package:flyrics/views/icons/error_icon.dart';
import 'package:flyrics/views/lyrics/lyrics_info_box.dart';

class LyricsError extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _colors = useColorStore();
    final ux = useUX();
    final t = useI18n();

    return LyricsInfoBox(
      icon: O(
        () => LyricsErrorIcon(
          size: ux.lyricsStatusIconSize,
          color: _colors.textColor,
        ),
      ),
      text: t('lyrics.error'),
    );
  }
}
