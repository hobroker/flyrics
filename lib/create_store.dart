import 'package:redux_epics/redux_epics.dart';
import 'package:redux/redux.dart';

import 'utils/distinct_store.dart';
import 'models/app_state.dart';
import 'epics/app_epic.dart';
import 'reducers/app_reducer.dart';

Store createStore() {
  var epicMiddleware = EpicMiddleware(appEpic);
  var store = DistinctStore<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [
      epicMiddleware,
//      new LoggingMiddleware.printer(),
    ],
  );

  return store;
}
