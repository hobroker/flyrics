import 'package:flyrics/api/api.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/search_store.dart';
import 'package:flyrics/stores/track_store.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:mobx/mobx.dart';

part 'player_store.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  bool isRunning = false;

  final TrackStore track;
  final SearchStore search;

  PlayerStoreBase({
    this.track,
    this.search,
  }) {
    when((_) => isRunning, track.fetchCurrentTrack);
    when((_) => isNotNull(track.track), updateSearchQuery);
    when((_) => search.results.isNotEmpty, triggerLyricsFetch);
  }

  @action
  Future fetchIsRunning() async {
    isRunning = await I<Api>().spotify.isRunning();
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
