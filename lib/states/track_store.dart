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

  final ArtworkStore artwork;

  TrackStoreBase({this.artwork});

  @action
  Future fetchCurrentTrack() async {
    isLoading = true;
    final json = await I<Api>().spotify.fetchCurrentTrack2();

    track = TrackModelStore.fromJson(json);
    isLoading = false;

    await artwork.fetchBytes(track.artwork);
  }

  @computed
  bool get hasTrack => track != null && !isLoading;
}
