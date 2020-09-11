import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/search.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:mobx/mobx.dart';

part 'player.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  bool isRunning = false;

  final TrackStore track = TrackStore();
  final SearchStore search = SearchStore();

  PlayerStoreBase() {
    fetchIsRunning();
    watchTrackRefresh();
    when((_) => isRunning, track.fetchCurrentTrack);
  }

  void watchTrackRefresh() {
    when((_) => isNotNull(track.track), updateSearchQuery);
    when((_) => search.results.isNotEmpty, triggerLyricsFetch);
  }

  @action
  Future fetchIsRunning() async {
    isRunning = await I<SpotifyService>().isRunning();
  }

  @action
  void updateSearchQuery() {
    search.query = '${track.track.artist} ${track.track.name}';
  }

  @action
  void triggerLyricsFetch() {
    final result = search.results.first;
    final url = result.url;

    track.lyrics.fetchGeniusLyrics(url);
  }
}
