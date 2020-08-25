import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/utils/sizing.dart';
import 'package:flyrics/views/header_screen.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/models/app_state.dart';
import 'connector.dart';

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
          backgroundColor: vm.backgroundColor ?? UI.primaryColor,
        );
      },
    );
  }
}

class _ViewModel {
  final Color backgroundColor;

  _ViewModel({
    this.backgroundColor,
  });

  bool operator ==(other) {
    return other.dominantColor == backgroundColor;
  }

  @override
  int get hashCode => super.hashCode;
}
