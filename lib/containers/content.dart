import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/lyrics.dart';
import 'package:flyrics/utils/connector.dart';
import 'package:flyrics/views/content_screen.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/models/app_state.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector<_ViewModel>(
      converter: (Store<AppState> store) => _ViewModel(
        backgroundColor: getArtworkDominantColor(store.state),
        textColor: getArtworkTextColor(store.state),
        text: getLyricsText(store.state),
        isLoading: areLyricsLoading(store.state),
      ),
      builder: (context, vm) {
        return ContentScreen(
          backgroundColor: vm.backgroundColor,
          textColor: vm.textColor,
          text: vm.isLoading ? 'loading...' : vm.text,
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final bool isLoading;

  _ViewModel({
    @required this.backgroundColor,
    @required this.textColor,
    @required this.text,
    @required this.isLoading,
  });

  bool operator ==(other) {
    return other.backgroundColor == backgroundColor &&
        other.textColor == textColor &&
        other.text == text &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => super.hashCode;
}
