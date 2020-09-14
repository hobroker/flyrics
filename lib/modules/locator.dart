import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/logger/app_logger.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.asNewInstance();

void setupLocator({Api api}) {
  // api
  I.registerSingleton<Api>(api);
  I.registerSingleton<TerminalService>(api.terminal);
  I.registerSingleton<SpotifyService>(api.spotify);
  I.registerSingleton<GeniusService>(api.genius);

  // logger
  I.registerSingleton<AppLogger>(AppLogger());

  // ux
  I.registerSingleton<UX>(UX());
}
