import 'package:flyrics/utils/fp.dart';
import 'package:mobx/mobx.dart';

part 'async.g.dart';

enum DataStatus {
  placeholder,
  loading,
  success,
  error,
  empty,
}

typedef AsyncDataFn = Function(Function);
typedef IsEmptyFn<DataT> = bool Function(DataT);
typedef FacadeFn<DataT> = DataT Function(dynamic);

class AsyncStore<T> = AsyncStoreBase with _$AsyncStore;

abstract class AsyncStoreBase<T> with Store {
  @observable
  DataStatus status = DataStatus.placeholder;

  @observable
  Object error;

  @observable
  T data;

  @computed
  bool get hasData => status == DataStatus.success;

  @computed
  bool get isLoading => status == DataStatus.loading;

  @computed
  bool get isEmpty => status == DataStatus.empty;

  final IsEmptyFn<T> _isEmpty;
  final FacadeFn<T> _facade;

  AsyncStoreBase({
    IsEmptyFn<T> isEmpty,
    FacadeFn<T> facade,
  })  : _isEmpty = isEmpty ?? isNotNull,
        _facade = facade;

  @action
  Future wait(Future future) async {
    status = DataStatus.loading;
    try {
      final result = await future;
      data = _facade == null ? result : _facade(result);
      status = _isEmpty(data) ? DataStatus.empty : DataStatus.success;
    } catch (err) {
      error = err;
      status = DataStatus.error;
    }
  }
}
