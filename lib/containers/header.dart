import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/store/connector.dart';
import 'package:flyrics/views/header_screen.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/models/app_state.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector<_ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
          backgroundColor: getArtworkDominantColor(store.state),
        );
      },
      builder: (context, vm) {
        return HeaderScreen(
          backgroundColor: vm.backgroundColor,
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

  @override
  bool operator ==(other) {
    return other.backgroundColor == backgroundColor &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => super.hashCode;
}
