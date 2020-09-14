import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:mobx/mobx.dart';

part 'track.g.dart';

class TrackStore = TrackStoreBase with _$TrackStore;

abstract class TrackStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isNewTrack = false;

  @observable
  Track track;

  @observable
  Object error;

  final ArtworkStore artwork;
  final LyricsStore lyrics;
  final SpotifyService spotifyService;

  TrackStoreBase({this.spotifyService, this.artwork, this.lyrics});

  @action
  Future updateCurrentTrack() async {
    if (track == null) {
      isLoading = true;
    }

    try {
      final json = await spotifyService.fetchCurrentTrack();
      final isNewTrack = track == null || json['id'] != track.id;

      if (isNewTrack) {
        track = Track.fromJson(json);
        isLoading = false;

        return track;
      }
    } catch (err) {
      error = err;
    }

    return null;
  }

  @computed
  bool get hasTrack => track != null && !isLoading;
}
