import 'dart:async';

import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/spotify.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/color.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/search.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/fp.dart';
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
  ColorStore color;
  LyricsStore lyrics;

  final SpotifyService spotifyService;

  PlayerStoreBase({
    this.spotifyService,
    GeniusService geniusService,
    TerminalService terminalService,
    UX ux,
  }) {
    track = TrackStore(spotifyService: spotifyService);
    artwork = ArtworkStore(spotifyService: spotifyService);
    lyrics = LyricsStore(geniusService: geniusService);
    color = ColorStore(ux: ux);
    search = SearchStore(
      geniusService: geniusService,
      terminalService: terminalService,
    );
  }

  void start() {
    reaction<List<int>>(
      (_) => artwork.bytes,
      (bytes) => color.fetchColors(bytes),
    );

    refreshFlow();
  }

  @computed
  bool get areLyricsLoading => lyrics.isLoading || search.isLoading;

  @computed
  bool get canShowLyrics => !areLyricsLoading && isNotNull(lyrics.text);

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
    final oldId = track.track?.id;
    final isNewTrack = (_) => track.track?.id != oldId;

    await track.fetchCurrentTrack();

    final _updateArtwork = when(isNewTrack, () async {
      await artwork.fetchBytes(track.track.artwork);
    });

    final _updateLyrics = when(isNewTrack, () async {
      final query = '${track.track.artist} ${track.track.name}';

      await search.searchQuery(query);
      await lyrics.fetchGeniusLyrics(search.activeResultUrl);
    });

    if (!isNewTrack(null)) {
      _updateLyrics();
      _updateArtwork();
    }

    isWorking = false;
    startTimer();
  }

  void startTimer() {
    Timer(Duration(milliseconds: 1500), refreshFlow);
  }
}
