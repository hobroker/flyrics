import 'package:flyrics/actions/app_actions.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:redux_epics/redux_epics.dart';

Stream openUrlEpic(Stream actions, store) => actions
    .where((action) => action is OpenUrlAction)
    .asyncMap((action) => I<Terminal>().openUrl(action.url));

final urlEpics = combineEpics<AppState>([
  openUrlEpic,
]);
