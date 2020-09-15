import 'package:flyrics/models/search_item.dart';
import 'package:flyrics/services/genius.dart';
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

  SearchStoreBase({this.geniusService});

  @action
  Future searchQuery(String str) async {
    isLoading = true;
    final list = await geniusService.search(str);
    results =
        List<SearchItem>.from(list.map((item) => SearchItem.fromJson(item)));
    isLoading = false;
  }
}
