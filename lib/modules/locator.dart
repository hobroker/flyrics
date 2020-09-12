import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/modules/logger/app_logger.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.asNewInstance();

Future setupLocator({
  Api api,
  PlayerStore player,
}) async {
  I.registerSingleton<AppLogger>(AppLogger());

  // api
  I.registerSingleton<Api>(api);
  I.registerSingleton<TerminalService>(api.terminal);
  I.registerSingleton<SpotifyService>(api.spotify);
  I.registerSingleton<GeniusService>(api.genius);

  //mobx
  I.registerSingleton<PlayerStore>(player);
  I.registerSingleton<TrackStore>(player.track);
}
