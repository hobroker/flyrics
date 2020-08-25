import 'package:flutter/material.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/views/content_screen.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/models/app_state.dart';
import 'connector.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Connector<_ViewModel>(
      converter: (Store<AppState> store) => _ViewModel(
        backgroundColor: getArtworkDominantColor(store.state),
      ),
      builder: (context, vm) {
        return ContentScreen(
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

  bool operator ==(other) {
    return other.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode => super.hashCode;
}
