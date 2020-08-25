import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
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
      ),
      builder: (context, vm) {
        return ContentScreen(
          backgroundColor: vm.backgroundColor,
          textColor: vm.textColor,
          text: 'one one one one one one\none one one one one one',
        );
      },
    );
  }
}

class _ViewModel {
  final Color backgroundColor;
  final Color textColor;

  _ViewModel({
    this.backgroundColor,
    this.textColor,
  });

  bool operator ==(other) {
    return other.backgroundColor == backgroundColor &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}
