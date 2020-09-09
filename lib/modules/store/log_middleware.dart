import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

class LogMiddleware<State> extends MiddlewareClass<State> {
  final bool logState;
  final bool enabled;

  LogMiddleware({
    this.enabled,
    this.logState = false,
  });

  @override
  void call(Store<State> store, dynamic action, NextDispatcher next) {
    var prevState = store.state;
    next(action);

    if (enabled && action != null && action.toString() != null) {
      debugPrint(_format(action));
      if (logState && prevState != store.state) {
        debugPrint('NEXT_STATE: ${store.state}');
      }
    }
  }

  String _format(dynamic action) => '\t⏩ $action';
}
