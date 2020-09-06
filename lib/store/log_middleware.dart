import 'package:redux/redux.dart';

class LogMiddleware<AppState> extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);

    if (action.toString() != null) {
      print(_format(action));
    }
  }

  String _format(dynamic action) => '\t⏩ $action';
}
