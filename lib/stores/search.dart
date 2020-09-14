import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/models/search_item.dart';
import 'package:mobx/mobx.dart';

part 'search.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String query;

  @observable
  List<SearchItem> results = [];

  final GeniusService geniusService;
  final TerminalService terminalService;

  SearchStoreBase({this.geniusService, this.terminalService});

  @action
  Future searchQuery(String str) async {
    isLoading = true;
    results = [];
    final list = await geniusService.search(str);
    results =
        List<SearchItem>.from(list.map((item) => SearchItem.fromJson(item)));
    isLoading = false;
  }

  @action
  Future openActiveResultInBrowser() async {
    await terminalService.openUrl(activeResultUrl);
  }

  @computed
  String get activeResultUrl => results.isNotEmpty ? results.first.url : null;
}
