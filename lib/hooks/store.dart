import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' hide Store;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:redux/redux.dart';

Store<AppState> useStore() => use(_UseStoreHook());

Function useDispatch() => useStore().dispatch;

dynamic useSelector(Selector selector) {
  final store = useStore();
  final snap = useStream<dynamic>(
    store.onChange.map(selector).distinct(notEqual),
    initialData: selector(store.state),
  );

  return snap.data;
}

typedef Selector = dynamic Function(AppState state);

class _UseStoreHook extends Hook<Store<AppState>> {
  @override
  HookState<Store<AppState>, Hook<Store<AppState>>> createState() =>
      _UseStoreHookState();
}

class _UseStoreHookState extends HookState<Store<AppState>, _UseStoreHook> {
  @override
  Store<AppState> build(BuildContext context) =>
      StoreProvider.of<AppState>(context);
}
