import 'package:flyrics/api/api.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/states/artwork_store.dart';
import 'package:flyrics/states/track_model.dart';
import 'package:mobx/mobx.dart';

part 'track_store.g.dart';

class TrackStore = TrackStoreBase with _$TrackStore;

abstract class TrackStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  TrackModelStore track;

  @observable
  ArtworkStore artwork;

  final ArtworkStore artworkStore;

  TrackStoreBase({this.artworkStore});

  @action
  Future fetchCurrentTrack() async {
    isLoading=true;
    final json = await I<Api>().spotify.fetchCurrentTrack2();

    track = TrackModelStore.fromJson(json);
    isLoading=false;

    await artworkStore.fetchBytes(track.artwork);
  }
}
