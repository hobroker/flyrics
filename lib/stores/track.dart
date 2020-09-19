import 'package:flyrics/models/track.dart';
import 'package:flyrics/modules/mobx/async_data.dart';
import 'package:flyrics/services/api.dart';
import 'package:mobx/mobx.dart';

part 'track.g.dart';

class TrackStore = TrackStoreBase with _$TrackStore;

abstract class TrackStoreBase with Store {
  @observable
  Track track;

  @observable
  DataStatus status = DataStatus.placeholder;

  @observable
  Object error;

  final ApiService _api;

  TrackStoreBase({ApiService api}) : _api = api {
    autorun((_) => print(track));
  }

  @action
  Future fetchCurrentTrack() async {
    if (track == null) {
      status = DataStatus.loading;
    }

    try {
      final json = await _api.spotify.fetchCurrentTrack();
      final isNewTrack = track == null || json['id'] != track.id;

      if (isNewTrack) {
        track = Track.fromJson(json);
      }

      status = DataStatus.success;
    } catch (err) {
      error = err;
      status = DataStatus.error;
    }
  }

  @computed
  bool get hasTrack => track != null && !isLoading;

  @computed
  bool get isLoading => status == DataStatus.loading;
}
