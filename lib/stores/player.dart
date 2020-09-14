import 'dart:async';

import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
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

  TrackStore track;
  SearchStore search;
  ArtworkStore artwork;
  LyricsStore lyrics;

  final SpotifyService spotifyService;

  PlayerStoreBase({
    this.spotifyService,
    GeniusService geniusService,
    TerminalService terminalService,
    UX ux,
  }) {
    track = TrackStore(
      spotifyService: spotifyService,
    );
    artwork = ArtworkStore(
      spotifyService: spotifyService,
      ux: ux,
    );
    lyrics = LyricsStore(
      geniusService: geniusService,
    );
    search = SearchStore(
      geniusService: geniusService,
      terminalService: terminalService,
    );
  }

  void start() {
    refreshFlow();
  }

  @computed
  bool get areLyricsLoading => lyrics.isLoading || search.isLoading;

  @action
  Future updateIsRunning() async {
    isRunning = await spotifyService.isRunning();
  }

  @action
  Future refreshFlow() async {
    isWorking = true;
    await updateIsRunning();

    if (!isRunning) {
      return;
    }

    final newTrack = await track.updateCurrentTrack();
    if (newTrack != null) {
      final query = '${newTrack.artist} ${newTrack.name}';
      lyrics.text = null;

      await Future.wait([
        artwork.fetchBytes(newTrack.artwork),
        () async {
          await search.searchQuery(query);
          await lyrics.fetchGeniusLyrics(search.activeResultUrl);
        }()
      ]);
    }

    isWorking = false;
    startTimer();
  }

  void startTimer() {
    Timer(Duration(milliseconds: 1500), refreshFlow);
  }
}
