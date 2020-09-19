import 'package:flyrics/modules/mobx/async_data.dart';
import 'package:flyrics/services/api.dart';

class ArtworkStore extends AsyncDataStore<List<int>> {
  final ApiService _api;

  ArtworkStore({ApiService api})
      : _api = api,
        super(
          isEmpty: (data) => data.isEmpty,
        );

  Future fetch(String url) => wait(_api.spotify.getImageBytes(url));
}
