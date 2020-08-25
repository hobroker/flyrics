import 'package:flyrics/epics/app_epic.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/reducers/app_reducer.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

String onlyLogActionFormatter<State>(
  State state,
  dynamic action,
  DateTime timestamp,
) {
  var result = '{$timestamp: $action}';
  print(result);
  return result;
}

final loggingMiddleware = LoggingMiddleware(formatter: onlyLogActionFormatter);

Store createStore() {
  var epicMiddleware = EpicMiddleware(appEpic);
  var store = Store<AppState>(
    appReducer,
    distinct: true,
    initialState: AppState(),
    middleware: [
      epicMiddleware,
      loggingMiddleware,
    ],
  );

  return store;
}
