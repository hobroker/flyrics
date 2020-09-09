import 'package:flyrics/epics/app_epic.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/modules/store/log_middleware.dart';
import 'package:flyrics/reducers/app_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

typedef TypedSelector<T> = T Function(AppState);

Store createStore() {
  var epicMiddleware = EpicMiddleware(appEpic);
  var logMiddleware = LogMiddleware(
    enabled: false,
  );

  var store = Store<AppState>(
    appReducer,
    distinct: true,
    initialState: AppState(),
    middleware: [
      epicMiddleware,
      logMiddleware,
    ],
  );

  return store;
}
