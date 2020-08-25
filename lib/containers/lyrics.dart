import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/utils/conditional.dart';
import 'package:flyrics/views/lyrics/lyrics_placeholder.dart';
import 'package:flyrics/views/lyrics/lyrics_screen.dart';

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (store) => _ViewModel(
        textColor: getArtworkTextColor(store.state),
        text: getLyricsText(store.state),
        hasLyrics: hasActiveTrackLyrics(store.state),
        isLoading: areLyricsLoading(store.state),
      ),
      builder: (context, vm) {
        return Conditional.single(
          when: !vm.isLoading && vm.hasLyrics,
          render: () => LyricsScreen(
            textColor: vm.textColor,
            text: vm.text,
          ),
          fallback: () => LyricsPlaceholder(
            isAnimated: vm.isLoading,
          ),
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
