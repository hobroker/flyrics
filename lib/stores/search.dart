import 'package:flyrics/models/search_item.dart';
import 'package:flyrics/modules/mobx/async_data.dart';
import 'package:flyrics/services/api.dart';

class SearchStore extends AsyncDataStore<List<int>> {
  final ApiService _api;

  SearchStore({ApiService api})
      : _api = api,
        super(
          isEmpty: (data) => data.isEmpty,
          facade: (list) => SearchItem.fromJsonList(list),
        );

  Future fetch(String query) => wait(_api.genius.search(query));
}
