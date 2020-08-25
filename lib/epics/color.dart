import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/actions/is_running_actions.dart';
import 'package:flyrics/utils/color.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> findArtworkColorsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchArtworkBytesSuccessAction)
        .asyncMap((action) => findImageColors(action.bytes))
        .map((colors) {
      return SetArtworkColorsAction(
        textColor: findOppositeColor(colors.first),
        colors: colors,
      );
    });

Stream<dynamic> resetColorsEpic(Stream<dynamic> actions, store) => actions
    .where((action) => action is SetIsRunningAction)
    .map((action) => !action.isRunning)
    .map((action) => ResetArtworkColorsAction());

final colorEpics = combineEpics<AppState>([
  findArtworkColorsEpic,
  resetColorsEpic,
]);
