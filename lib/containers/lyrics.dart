import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/utils/conditional.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_screen.dart';

class Lyrics extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = useSelector<AppState, Color>(resolveArtworkTextColor);
    final text = useSelector<AppState, String>(getLyricsText);
    final hasLyrics = useSelector<AppState, bool>(activeTrackHasLyrics);
    final isLoading = useSelector<AppState, bool>(areLyricsLoading);

    return Conditional.single(
      when: hasLyrics,
      render: () => LyricsScreen(
        textColor: textColor,
        text: text,
      ),
      fallback: () => LyricsPlaceholder(
        isAnimated: isLoading,
      ),
    );
  }
}
