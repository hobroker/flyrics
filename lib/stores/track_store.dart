import 'package:flyrics/api/api.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/artwork_store.dart';
import 'package:flyrics/stores/lyrics_store.dart';
import 'package:flyrics/stores/track_model.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:mobx/mobx.dart';

part 'track_store.g.dart';

class TrackStore = TrackStoreBase with _$TrackStore;

abstract class TrackStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  TrackModelStore track;

  final ArtworkStore artwork;
  final LyricsStore lyrics;

  TrackStoreBase({
    this.artwork,
    this.lyrics,
  }) {
    when((_) => isNotNull(track), () {
      artwork.fetchBytes(track.artwork);
    });
  }

  @action
  Future fetchCurrentTrack() async {
    isLoading = true;
    final json = await I<Api>().spotify.fetchCurrentTrack2();

    track = TrackModelStore.fromJson(json);
    isLoading = false;
  }

  @computed
  bool get hasTrack => track != null && !isLoading;
}
