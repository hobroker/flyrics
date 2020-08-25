import 'package:flyrics/api/http.dart';
import 'package:flyrics/api/spotify.dart';
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
        .asyncMap((action) => Spotify.fetchCurrentTrack().then((track) {
              return FetchTrackSuccessAction(track);
            }));

Stream<dynamic> fetchArtworkImageAsBytesEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchTrackSuccessAction)
        .where((event) => shouldUpdateArtwork(store.state))
        .map((action) => getTrackArtwork(store.state))
        .where((url) => url != null)
        .asyncMap((url) => Http.fetchImageBytes(url).then((response) {
              return FetchArtworkBytesSuccessAction(response);
            }));

Stream<dynamic> findArtworkColorsEpic(
        Stream<dynamic> actions, EpicStore<AppState> store) =>
    actions
        .where((action) => action is FetchArtworkBytesSuccessAction)
        .asyncMap((action) async {
      var image = await loadImage(action.artworkBytes);
      var generator = await PaletteGenerator.fromImage(
        image,
        maximumColorCount: 10,
      );

      var backgroundColor = generator.dominantColor?.color;
      var textColor = autoDarken(backgroundColor);

      return FetchArtworkColorsSuccessAction(
        backgroundColor: backgroundColor,
        textColor: textColor,
      );
    });
