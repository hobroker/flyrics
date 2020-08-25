import 'package:flyrics/epics/app_epic.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/reducers/app_reducer.dart';
import 'package:flyrics/utils/log_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

Store createStore() {
  var epicMiddleware = EpicMiddleware(appEpic);
  var logMiddleware = LogMiddleware();

  var store = Store<AppState>(
    appReducer,
    distinct: true,
    initialState: AppState.init(),
    middleware: [
      epicMiddleware,
      logMiddleware,
    ],
  );

  return store;
}
