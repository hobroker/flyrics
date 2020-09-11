import 'package:flyrics/api/api.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:mobx/mobx.dart';

part 'lyrics_store.g.dart';

class LyricsStore = LyricsStoreBase with _$LyricsStore;

abstract class LyricsStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String text;

  @action
  Future fetchGeniusLyrics(String url) async {
    isLoading = true;
    text = await I<Api>().genius.fetchLyrics(url);
    isLoading = false;
  }
}
