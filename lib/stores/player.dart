import 'dart:async';

import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/search.dart';
import 'package:flyrics/stores/track.dart';
import 'package:mobx/mobx.dart';

part 'player.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  bool isRunning = false;

  @observable
  bool isWorking = false;

  final TrackStore track = TrackStore();
  final SearchStore search = SearchStore();

  void start() {
    refreshFlow();
  }

  @action
  Future refreshFlow() async {
    isWorking = true;
    isRunning = await I<SpotifyService>().isRunning();

    if (!isRunning) {
      return;
    }

    final newTrack = await track.updateCurrentTrack();
    if (newTrack != null) {
      track.lyrics.text = null;
      await track.artwork.fetchBytes(newTrack.artwork);

      final query = '${newTrack.artist} ${newTrack.name}';
      await search.searchQuery(query);
      await track.lyrics.fetchGeniusLyrics(search.activeResultUrl);
    }

    isWorking = false;
    startTimer();
  }

  void startTimer() {
    Timer(Duration(milliseconds: 1500), refreshFlow);
  }
}
