import 'dart:async';

import 'package:flyrics/models/track.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/color.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/player.dart';
import 'package:flyrics/stores/track.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:mobx/mobx.dart';

part 'runner.g.dart';

class RunnerStore = RunnerStoreBase with _$RunnerStore;

abstract class RunnerStoreBase with Store {
  @observable
  bool isRunning = false;

  @observable
  bool isWorking = false;

  bool _canRun = false;

  final PlayerStore player;

  RunnerStoreBase({
    this.player,
  }) {
    reaction<bool>((_) => isWorking, _onIsWorkingChange);
    reaction<Track>((_) => track.track, _onTrackChange);
  }

  TrackStore get track => player.track;

  ArtworkStore get artwork => player.artwork;

  ColorStore get color => player.color;

  LyricsStore get lyrics => player.lyrics;

  void start() {
    _canRun = true;
    _runRefreshFlow(now: true);
  }

  void stop() {
    _canRun = false;
  }

  @action
  Future refreshFlow() async {
    isWorking = true;
    when((_) => !isWorking, _runRefreshFlow);
  }

  void _runRefreshFlow({bool now = false}) {
    if (!_canRun) {
      return;
    }

    if (now) {
      refreshFlow();
    } else {
      Timer(Duration(milliseconds: 1500), refreshFlow);
    }
  }

  Future _fetchArtworkAndColors() async {
    await artwork.fetch(track.track.artwork);
    if (artwork.hasData) {
      await color.fetchColors(artwork.data);
    }
  }

  void _onTrackChange(track) {
    if (isNull(track)) {
      return;
    }

    _fetchArtworkAndColors();
    lyrics.updateLyrics(track);

    isWorking = false;
  }

  void _onIsWorkingChange(_isWorking) async {
    if (!_isWorking) {
      return;
    }

    await player.updateIsRunning();
    if (!player.isRunning) {
      return;
    }

    final oldId = track.track?.id;
    await track.fetchCurrentTrack();

    if (track.track?.id == oldId) {
      isWorking = false;
    }
  }
}
