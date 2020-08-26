import 'package:redux/redux.dart';

class LogMiddleware<State> extends MiddlewareClass<State> {
  @override
  void call(Store<State> store, dynamic action, NextDispatcher next) {
    if (action.toString() != null) {
      print(_format(action));
    }

    next(action);
  }

  String _format(dynamic action) => '\t⏩ $action';
}
