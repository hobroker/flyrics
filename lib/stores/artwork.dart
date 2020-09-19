import 'package:flyrics/services/api.dart';
import 'package:flyrics/modules/mobx/async.dart';

class ArtworkStore extends AsyncStore<List<int>> {
  final ApiService _api;

  ArtworkStore(ApiService api)
      : _api = api,
        super(
          isEmpty: (data) => data.isEmpty,
        );

  Future fetch(String url) => wait(_api.spotify.getImageBytes(url));
}
