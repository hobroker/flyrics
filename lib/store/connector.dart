import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:redux/redux.dart';

bool _onWillChange(prevViewModel, newViewModel) =>
    prevViewModel != newViewModel;

class Connector<ViewModel> extends StatelessWidget {
  final Function(Store<AppState> store) converter;
  final Function(BuildContext context, ViewModel vm) builder;

  Connector({this.converter, this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      distinct: true,
      onWillChange: _onWillChange,
      converter: converter,
      builder: builder,
    );
  }
}

class MappedConnector<bool> extends StatelessWidget {
  final Map<String, Function(AppState state)> converter;
  final Function(BuildContext context, dynamic vm) builder;

  const MappedConnector({
    Key key,
    this.converter,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
      distinct: true,
      onWillChange: _onWillChange,
      converter: (Store<AppState> store) {
        var map = {};

        converter.forEach((key, value) {
          map[key] = value(store.state);
        });

        return map;
      },
      builder: builder,
    );
  }
}
