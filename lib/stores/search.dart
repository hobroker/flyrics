import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/models/search_item.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/utils/fp.dart';
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
    when((_) => isNotNull(query), searchCurrentQuery);
  }

  @action
  Future searchCurrentQuery() async {
    results = await I<GeniusService>().search(query).catchError((e) {
      print(e);
      return [];
    });
  }

  @action
  Future openActiveResultInBrowser() async {
    await I<TerminalService>().openUrl(activeResultUrl);
  }

  @computed
  String get activeResultUrl => results?.first?.url;
}
