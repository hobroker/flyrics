import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/modules/app_logger.dart';
import 'package:flyrics/modules/config.dart';
import 'package:flyrics/stores/artwork_store.dart';
import 'package:flyrics/stores/lyrics_store.dart';
import 'package:flyrics/stores/player_store.dart';
import 'package:flyrics/stores/search_store.dart';
import 'package:flyrics/stores/test_store.dart';
import 'package:flyrics/stores/track_store.dart';
import 'package:get_it/get_it.dart';

final I = GetIt.asNewInstance();

Future setupLocator() async {
  final config = await Config.init();

  I.registerSingleton<Api>(Api(config));
  I.registerSingleton<Terminal>(Terminal());
  I.registerSingleton<AppLogger>(AppLogger());

  I.registerSingleton<ArtworkStore>(ArtworkStore());
  I.registerSingleton<LyricsStore>(LyricsStore());
  I.registerSingleton<SearchStore>(SearchStore());
  I.registerSingleton<TrackStore>(TrackStore(
    artwork: I<ArtworkStore>(),
    lyrics: I<LyricsStore>(),
  ));
  I.registerSingleton<PlayerStore>(PlayerStore(
    track: I<TrackStore>(),
    search: I<SearchStore>(),
  ));
  I.registerSingleton<TestStore>(TestStore());
}
