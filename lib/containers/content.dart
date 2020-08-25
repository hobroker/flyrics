import 'package:flutter/material.dart';
import 'package:flyrics/containers/lyrics.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/lyrics_wrapper_screen.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/models/app_state.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector<_ViewModel>(
      converter: (Store<AppState> store) => _ViewModel(
        backgroundColor: getArtworkDominantColor(store.state),
      ),
      builder: (context, vm) {
        return LyricsWrapperScreen(
          backgroundColor: vm.backgroundColor,
          child: Lyrics(),
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final Color backgroundColor;

  _ViewModel({
    @required this.backgroundColor,
  });

  @override
  bool operator ==(other) {
    return other.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode => super.hashCode;
}
