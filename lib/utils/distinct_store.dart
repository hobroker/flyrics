import 'package:flyrics/models/app_state.dart';
import 'package:redux/redux.dart' show Middleware, Reducer, Store;

class DistinctStore<T> extends Store<T> {
  DistinctStore(
    Reducer<T> reducer, {
    T initialState,
    List<Middleware<T>> middleware: const [],
    bool syncStream: false,
  }) : super(reducer, initialState: initialState, middleware: middleware);

  @override
  Stream<T> get onChange =>
      super.onChange.distinct((prev, next) => prev == next);
}
