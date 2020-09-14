import 'package:flyrics/services/spotify.dart';
import 'package:mobx/mobx.dart';

part 'artwork.g.dart';

class ArtworkStore = ArtworkStoreBase with _$ArtworkStore;

abstract class ArtworkStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Object error;

  @observable
  List<int> bytes;

  final SpotifyService spotifyService;

  ArtworkStoreBase({this.spotifyService});

  @action
  Future fetchBytes(String url) async {
    isLoading = true;
    try {
      bytes = await spotifyService.getImageBytes(url);
    } catch (err) {
      error = err;
    }
    isLoading = false;
  }

  @computed
  bool get hasBytes => !isLoading && bytes != null;
}
