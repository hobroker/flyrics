import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/models/search_item.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:mobx/mobx.dart';

part 'search.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String query;

  @observable
  List<SearchItem> results;

  SearchStoreBase() {
    reaction((_) => query, searchQuery);
  }

  @action
  Future searchQuery(String str) async {
    results = await I<GeniusService>().search(str);
  }

  @action
  Future openActiveResultInBrowser() async {
    await I<TerminalService>().openUrl(activeResultUrl);
  }

  @computed
  String get activeResultUrl => results?.elementAt(0)?.url;
}
