import 'package:redux/redux.dart'
    show Middleware, NextDispatcher, Reducer, Store;

class DistinctStore<T> extends Store<T> {
  DistinctStore(
    Reducer<T> reducer, {
    T initialState,
    List<Middleware<T>> middleware: const [],
    bool syncStream: false,
  }) : super(reducer, initialState: initialState, middleware: middleware);

  @override
  NextDispatcher _createReduceAndNotify(bool distinct) {
    return (dynamic action) {
      print('action');
    };
  }
}
