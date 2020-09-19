import 'dart:async';

import 'package:flyrics/services/api.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/color.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/runner.dart';
import 'package:flyrics/stores/track.dart';
import 'package:mobx/mobx.dart';

part 'player.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  bool isRunning = false;

  @observable
  bool isWorking = false;

  RunnerStore runner;

  final TrackStore track;
  final ArtworkStore artwork;
  final ColorStore color;
  final LyricsStore lyrics;
  final ApiService _api;

  PlayerStoreBase({
    ApiService api,
    this.artwork,
    this.color,
    this.lyrics,
    this.track,
  }) : _api = api {
    runner = RunnerStore(player: this);
    runner.start();
  }

  @action
  Future updateIsRunning() async {
    isRunning = await _api.spotify.isRunning();
  }
}
