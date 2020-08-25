import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/views/header_screen.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/models/app_state.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
          backgroundColor: getArtworkBackgroundColor(store.state),
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

  _ViewModel({
    this.backgroundColor,
  });
}
