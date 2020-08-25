import 'package:flyrics/utils/color.dart';
import 'package:flyrics/actions/track_actions.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> findArtworkColorsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchArtworkBytesSuccessAction)
        .asyncMap((action) async {
      var colors = await findImageColors(action.bytes);
      var backgroundColor = colors.first;
      var textColor = autoDarken(backgroundColor);

      return FetchArtworkColorsSuccessAction(
        dominantColor: backgroundColor,
        textColor: textColor,
        colors: colors,
      );
    });

final colorEpics = combineEpics<AppState>([
  findArtworkColorsEpic,
]);
