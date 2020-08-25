import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flyrics/models/app_state.dart';

class Connector<ViewModel> extends StatelessWidget {
  final Function(Store<AppState> store) converter;
  final Function(BuildContext context, ViewModel vm) builder;

  Connector({this.converter, this.builder});

  bool onWillChange(prevViewModel, newViewModel) => prevViewModel != newViewModel;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      distinct: true,
      onWillChange: onWillChange,
      converter: converter,
      builder: builder,
    );
  }
}
