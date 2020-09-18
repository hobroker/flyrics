import 'package:flyrics/models/search_item.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/stores/search.dart';
import 'package:flyrics/utils/fp.dart';
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

  @observable
  int selectedSearchIdx;

  final GeniusService geniusService;
  final TerminalService terminalService;
  SearchStore search;

  LyricsStoreBase({this.geniusService, this.terminalService}) {
    search = SearchStore(
      geniusService: geniusService,
    );
  }

  @computed
  bool get canShow => !isLoading && isNotNull(text);

  @computed
  SearchItem get selectedSearchItem => selectedSearchIdx != null
      ? search.results.elementAt(selectedSearchIdx)
      : null;

  @computed
  String get selectedSearchItemUrl => selectedSearchItem?.url;

  @action
  Future updateLyrics(Track track) async {
    isLoading = true;
    final query = '${track.artist} ${track.name}';

    selectedSearchIdx = null;
    await search.searchQuery(query);

    // TODO check when there are no results (or relevant ones)
    selectedSearchIdx = 0;
    await _fetchGeniusLyrics(selectedSearchItemUrl);

    isLoading = false;
  }

  @action
  Future _fetchGeniusLyrics(String url) async {
    isLoading = true;
    try {
      text = await geniusService.fetchLyrics(url);
    } catch (err) {
      error = err;
    }
    isLoading = false;
  }

  @action
  Future openSelectedItemInBrowser() async {
    await terminalService.openUrl(selectedSearchItemUrl);
  }
}
