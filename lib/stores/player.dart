import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flyrics/services/api.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/lyrics.dart';
import 'package:flyrics/stores/runner.dart';
import 'package:flyrics/stores/theme.dart';
import 'package:flyrics/stores/track.dart';
import 'package:mobx/mobx.dart';

part 'player.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  bool isRunning = false;

  RunnerStore runner;

  final TrackStore track;
  final ArtworkStore artwork;
  final LyricsStore lyrics;
  final ApiService _api;
  final ThemeStore _theme;

  PlayerStoreBase({
    ThemeStore theme,
    ApiService api,
    this.artwork,
    this.lyrics,
    this.track,
  })  : _api = api,
        _theme = theme {
    runner = RunnerStore(player: this);
    runner.start();
  }

  @action
  void setThemeColors(List<Color> colors) => _theme.setColors(colors);

  @computed
  ThemeData get theme => _theme.theme;

  @action
  Future updateIsRunning() async {
    isRunning = await _api.spotify.isRunning();
  }
}
