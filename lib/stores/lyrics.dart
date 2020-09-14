import 'package:flyrics/api/genius.dart';
import 'package:flyrics/modules/locator.dart';
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

  @action
  Future fetchGeniusLyrics(String url) async {
    isLoading = true;
    try {
      text = await I<GeniusService>().fetchLyrics(url);
    } catch (err) {
      error = err;
    }
    isLoading = false;
  }
}
