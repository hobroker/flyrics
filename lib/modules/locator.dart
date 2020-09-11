import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/config.dart';
import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/modules/logger/app_logger.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.asNewInstance();

Future setupLocator() async {
  I.registerSingleton<AppLogger>(AppLogger());

  await _setupApi();
  _setupMobx();
}

void _setupApi() async {
  final config = await ConfigService.init();
  final api = Api(config);

  I.registerSingleton<Api>(api);
  I.registerSingleton<TerminalService>(api.terminal);
  I.registerSingleton<SpotifyService>(api.spotify);
  I.registerSingleton<GeniusService>(api.genius);
}

void _setupMobx() {
  final player = PlayerStore();

  I.registerSingleton<PlayerStore>(player);
  I.registerSingleton<TrackStore>(player.track);
}
