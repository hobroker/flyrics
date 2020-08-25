import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/lyrics/lyrics_screen.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (state) => _ViewModel(
        textColor: getArtworkTextColor(state),
        text: getLyricsText(state),
        hasLyrics: hasActiveTrackLyrics(state),
        isLoading: areLyricsLoading(state),
      ),
      builder: (context, vm) {
        return vm.isLoading || !vm.hasLyrics
            ? LyricsPlaceholder()
            : LyricsScreen(
                textColor: vm.textColor,
                text: vm.text,
              );
      },
    );
  }
}

@immutable
class _ViewModel {
  final Color textColor;
  final String text;
  final bool hasLyrics;
  final bool isLoading;

  _ViewModel({
    @required this.textColor,
    @required this.text,
    @required this.hasLyrics,
    @required this.isLoading,
  });

  @override
  bool operator ==(other) {
    return other.textColor == textColor &&
        other.text == text &&
        other.hasLyrics == hasLyrics &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => super.hashCode;
}
