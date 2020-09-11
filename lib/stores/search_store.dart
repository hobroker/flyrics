import 'package:built_collection/built_collection.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/shell_api.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String query;

  @observable
  BuiltList<SearchResult> results;

  SearchStoreBase() {
    when((_) => isNotNull(query), searchCurrentQuery);
  }

  @action
  Future searchCurrentQuery() async {
    results = await I<Api>().genius.search(query);
  }

  @action
  Future openActiveResultInBrowser() async {
    await I<Terminal>().openUrl(activeResultUrl);
  }

  @computed
  String get activeResultUrl => results?.first?.url;
}
