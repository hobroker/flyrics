import 'package:flyrics/utils/color.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> findArtworkColorsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchArtworkBytesSuccessAction)
        .asyncMap((action) => findImageColors(action.bytes))
        .map((colors) {
      return FetchArtworkColorsSuccessAction(
        textColor: findOppositeColor(colors.first),
        colors: colors,
      );
    });

final colorEpics = combineEpics<AppState>([
  findArtworkColorsEpic,
]);
