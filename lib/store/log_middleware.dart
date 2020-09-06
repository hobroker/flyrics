import 'package:redux/redux.dart';

class LogMiddleware extends MiddlewareClass {
  @override
  void call(Store store, dynamic action, NextDispatcher next) {
    next(action);

    if (action.toString() != null) {
      print(_format(action));
    }
  }

  String _format(dynamic action) => '\t⏩ $action';
}
