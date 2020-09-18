import 'dart:async';

import 'package:flyrics/models/track.dart';
import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/spotify.dart';
import 'package:flyrics/services/terminal.dart';
import 'package:flyrics/services/ux.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/color.dart';
import 'package:flyrics/stores/lyrics.dart';
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
    lyrics = LyricsStore(
      geniusService: geniusService,
      terminalService: terminalService,
    );
    color = ColorStore(ux: ux);

    start();
  }

  void start() {
    reaction<List<int>>(
      (_) => artwork.bytes,
      (bytes) => color.fetchColors(bytes),
    );

    reaction<Track>(
      (_) => track.track,
      (track) => artwork.fetchBytes(track.artwork),
    );

    reaction<Track>(
      (_) => track.track,
      (track) async {
        try {
          await lyrics.updateLyrics(track);
        } finally {
          isWorking = false;
        }
      },
    );

    _runRefreshFlow(now: true);
  }

  @action
  Future updateIsRunning() async {
    isRunning = await spotifyService.isRunning();
  }

  @action
  Future refreshFlow() async {
    isWorking = true;
    await updateIsRunning();
    when((_) => !isWorking, _runRefreshFlow);

    if (!isRunning) {
      isWorking = false;

      return;
    }

    final oldId = track.track?.id;

    await track.fetchCurrentTrack();

    if (track.track?.id == oldId) {
      isWorking = false;
    }
  }

  void _runRefreshFlow({bool now = false}) {
    if (now) {
      refreshFlow();
    } else {
      Timer(Duration(milliseconds: 1500), refreshFlow);
    }
  }
}
