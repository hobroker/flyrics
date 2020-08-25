import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/http.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/selectors/artwork.dart';
import 'package:flyrics/selectors/track.dart';
import 'package:flyrics/utils/color.dart';
import 'package:flyrics/utils/load_image.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/actions/track_actions.dart';

Stream<dynamic> fetchCurrentTrackEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackStartAction)
        .map((action) => getTrack(store.state))
        .asyncMap((currentTrack) {
          return api.spotify.fetchCurrentTrack().then((track) {
              if (currentTrack != track) {
                return FetchTrackSuccessAction(track);
              }
            });
        });

Stream<dynamic> fetchArtworkImageAsBytesEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackSuccessAction)
        .map((action) => getArtworkUrl(store.state))
        .where((url) => url != null)
        .asyncMap((url) => Http.getBytes(url).then((response) {
              return FetchArtworkBytesSuccessAction(response);
            }));

Stream<dynamic> findArtworkColorsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchArtworkBytesSuccessAction)
        .asyncMap((action) async {
      var image = await loadImage(action.bytes);
      var generator = await PaletteGenerator.fromImage(
        image,
        maximumColorCount: 10,
      );

      var backgroundColor = generator.dominantColor?.color;
      var textColor = autoDarken(backgroundColor);

      return FetchArtworkColorsSuccessAction(
        dominantColor: backgroundColor,
        textColor: textColor,
      );
    });
