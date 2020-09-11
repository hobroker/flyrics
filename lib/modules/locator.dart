import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/modules/app_logger.dart';
import 'package:flyrics/modules/config.dart';
import 'package:flyrics/states/artwork_store.dart';
import 'package:flyrics/states/player_store.dart';
import 'package:flyrics/states/test_store.dart';
import 'package:flyrics/states/track_store.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.asNewInstance();

Future setupLocator() async {
  final config = await Config.init();

  I.registerSingleton<Api>(Api(config));
  I.registerSingleton<Terminal>(Terminal());
  I.registerSingleton<AppLogger>(AppLogger());

  I.registerSingleton<ArtworkStore>(ArtworkStore());
  I.registerSingleton<TrackStore>(TrackStore(
    artworkStore: I<ArtworkStore>(),
  ));
  I.registerSingleton<PlayerStore>(PlayerStore(
    trackStore: I<TrackStore>(),
  ));
  I.registerSingleton<TestStore>(TestStore());
}
