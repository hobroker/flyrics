import 'package:flyrics/models/track.dart';
import 'package:flyrics/services/genius.dart';
import 'package:flyrics/stores/search.dart';
import 'package:mobx/mobx.dart';

part 'lyrics.g.dart';

class LyricsStore = LyricsStoreBase with _$LyricsStore;

abstract class LyricsStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Object error;

  @observable
  String text;

  final GeniusService geniusService;
  final SearchStore search;

  LyricsStoreBase({this.geniusService, this.search});

  @action
  Future updateLyrics(Track track) async {
    isLoading = true;
    final query = '${track.artist} ${track.name}';

    await search.searchQuery(query);
    await fetchGeniusLyrics(search.activeResultUrl);

    isLoading = false;
  }

  @action
  Future fetchGeniusLyrics(String url) async {
    isLoading = true;
    try {
      text = await geniusService.fetchLyrics(url);
    } catch (err) {
      error = err;
    }
    isLoading = false;
  }
}
