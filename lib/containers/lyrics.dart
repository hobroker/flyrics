import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/lyrics/screen.dart';
import 'package:flyrics/views/lyrics/placeholder.dart';

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector(
      converter: (state) => _ViewModel(
        textColor: getArtworkTextColor(state),
        text: getLyricsText(state),
        isLoading: areLyricsLoading(state),
      ),
      builder: (context, vm) {
        return vm.isLoading
            ? LyricsPlaceholder()
            : LyricsContent(
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
  final bool isLoading;

  _ViewModel({
    @required this.textColor,
    @required this.text,
    @required this.isLoading,
  });

  @override
  bool operator ==(other) {
    return other.textColor == textColor &&
        other.text == text &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => super.hashCode;
}
