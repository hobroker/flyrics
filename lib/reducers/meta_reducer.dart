import 'package:flutter/material.dart';
import 'package:flyrics/actions/meta_actions.dart';
import 'package:flyrics/models/meta.dart';
import 'package:redux/redux.dart';

final metaReducer = combineReducers<Meta>([
  TypedReducer<Meta, SetBackgroundColorAction>((state, action) {
    return Meta(
      backgroundColor: Color(0xff62D36E),
    );
  }),
]);
