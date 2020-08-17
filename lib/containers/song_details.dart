import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flyrics/actions/actions.dart';
import 'package:flyrics/views/song_details_screen.dart';
import 'package:flyrics/models/app_state.dart';

class SongDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
          counter: store.state.counter,
          onIncrement: () => store.dispatch(CounterIncrementAction()),
          onAdd: (num) => store.dispatch(CounterAddAction(num)),
        );
      },
      builder: (context, vm) {
        return SongDetailsScreen(
          counter: vm.counter,
          onIncrement: vm.onIncrement,
          onAdd: vm.onAdd,
        );
      },
    );
  }
}

class _ViewModel {
  final int counter;
  final Function() onIncrement;
  final Function(int) onAdd;

  _ViewModel({
    this.counter,
    this.onIncrement,
    this.onAdd,
  });
}
