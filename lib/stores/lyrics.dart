import 'package:flyrics/models/search_item.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/modules/mobx/async_data.dart';
import 'package:flyrics/services/api.dart';
import 'package:flyrics/stores/search.dart';
import 'package:mobx/mobx.dart';

part 'lyrics.g.dart';

class LyricsStore = LyricsStoreBase with _$LyricsStore;

abstract class LyricsStoreBase with Store {
  @observable
  String text;

  @observable
  Object error;

  @observable
  DataStatus status = DataStatus.placeholder;

  @observable
  int selectedSearchIdx;

  final ApiService _api;
  final SearchStore search;

  LyricsStoreBase({ApiService api})
      : _api = api,
        search = SearchStore(api: api);

  @computed
  SearchItem get selectedSearchItem => selectedSearchIdx != null
      ? search.data.elementAt(selectedSearchIdx)
      : null;

  @computed
  bool get isLoading => status == DataStatus.loading;

  @computed
  String get selectedSearchItemUrl => selectedSearchItem?.url;

  @action
  Future updateLyrics(Track track) async {
    status = DataStatus.loading;
    final query = '${track.artist} ${track.name}';

    selectedSearchIdx = null;
    await search.fetch(query);

    if (search.isEmpty) {
      status = DataStatus.empty;
    } else {
      selectedSearchIdx = 0;
      await _fetchGeniusLyrics(selectedSearchItemUrl);
    }
  }

  @action
  Future _fetchGeniusLyrics(String url) async {
    try {
      text = await _api.genius.fetchLyrics(url);
      status = DataStatus.success;
    } catch (err) {
      error = err;
      status = DataStatus.error;
    }
  }

  @action
  Future openSelectedItemInBrowser() async {
    await _api.native.openUrl(selectedSearchItemUrl);
  }
}
