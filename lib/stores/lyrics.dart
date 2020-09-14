import 'package:flyrics/api/genius.dart';
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

  LyricsStoreBase({this.geniusService});

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
