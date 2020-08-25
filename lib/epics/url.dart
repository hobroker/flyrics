import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

Stream openUrlEpic(Stream actions, store) => actions
    .where((action) => action is OpenUrlAction)
    .asyncMap((action) => api.url.openUrl(action.url));

final urlEpics = combineEpics<AppState>([
  openUrlEpic,
]);
