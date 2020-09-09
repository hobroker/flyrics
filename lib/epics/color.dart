import 'package:flyrics/actions/artwork_actions.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/models/state/app_state.dart';
import 'package:flyrics/modules/color_extension.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/utils/image.dart';
import 'package:redux_epics/redux_epics.dart';

Stream findArtworkColorsEpic(Stream actions, store) => actions
        .where((action) => action is FetchArtworkBytesSuccessAction)
        .asyncMap((action) => findImageColors(action.bytes))
        .map((colors) {
      final dominantColor = colors.first.autoDarkened;
      final id = getActiveTrackId(store.state);
      final artwork = ArtworkModel((b) => b
        ..dominantColor = dominantColor
        ..textColor = dominantColor.opposite
        ..colors = colors);

      return SetArtworkColorsAction(artwork, id: id);
    });

final colorEpics = combineEpics<AppState>([
  findArtworkColorsEpic,
]);
