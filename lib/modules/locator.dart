import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/config.dart';
import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/modules/logger/app_logger.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/search.dart';
import 'package:flyrics/stores/track.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.asNewInstance();

Future setupLocator() async {
  final config = await ConfigService.init();
  final api = Api(config);

  I.registerSingleton<Api>(api);
  I.registerSingleton<TerminalService>(api.terminal);
  I.registerSingleton<SpotifyService>(api.spotify);
  I.registerSingleton<GeniusService>(api.genius);

  I.registerSingleton<AppLogger>(AppLogger());

  I.registerSingleton<TrackStore>(TrackStore(
    artwork: ArtworkStore(),
    lyrics: LyricsStore(),
  ));
  I.registerSingleton<PlayerStore>(PlayerStore(
    track: I<TrackStore>(),
    search: SearchStore(),
  ));
}
