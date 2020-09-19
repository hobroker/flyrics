import 'package:flyrics/models/track.dart';
import 'package:flyrics/services/api.dart';
import 'package:mobx/mobx.dart';

part 'track.g.dart';

class TrackStore = TrackStoreBase with _$TrackStore;

abstract class TrackStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Track track;

  @observable
  Object error;

  final ApiService _api;

  TrackStoreBase({ApiService api}) : _api = api {
    autorun((_) => print(track));
  }

  @action
  Future fetchCurrentTrack() async {
    if (track == null) {
      isLoading = true;
    }

    try {
      final json = await _api.spotify.fetchCurrentTrack();
      final isNewTrack = track == null || json['id'] != track.id;

      if (isNewTrack) {
        track = Track.fromJson(json);
      }

      isLoading = false;
    } catch (err) {
      error = err;
    }
  }

  @computed
  bool get hasTrack => track != null && !isLoading;
}
