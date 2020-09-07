import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';

class LyricsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = useSelector<AppState, Color>(resolveArtworkTextColor);
    final text = useSelector<AppState, String>(getLyricsText);

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
