import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/models/track.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:mobx/mobx.dart';

part 'track.g.dart';

class TrackStore = TrackStoreBase with _$TrackStore;

abstract class TrackStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Track track;

  final ArtworkStore artwork = ArtworkStore();
  final LyricsStore lyrics = LyricsStore();

  TrackStoreBase() {
    when((_) => isNotNull(track), () {
      artwork.fetchBytes(track.artwork);
    });
  }

  @action
  Future fetchCurrentTrack() async {
    isLoading = true;
    final json = await I<SpotifyService>().fetchCurrentTrack();

    track = Track.fromJson(json);
    isLoading = false;
  }

  @computed
  bool get hasTrack => track != null && !isLoading;
}
