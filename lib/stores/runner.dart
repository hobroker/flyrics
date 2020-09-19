import 'dart:async';

import 'package:flyrics/models/track.dart';
import 'package:flyrics/modules/mobx/async_data.dart';
import 'package:flyrics/stores/artwork.dart';
import 'package:flyrics/stores/color.dart';
import 'package:flyrics/stores/player.dart';
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
  final ColorStore color = ColorStore();

  RunnerStoreBase({
    this.player,
  }) {
    reaction<bool>((_) => isWorking, _onIsWorkingChange);
    reaction<Track>((_) => track, _onTrackChange);
  }

  @computed
  Track get track => player.track.track;

  ArtworkStore get artwork => player.artwork;

  @action
  Future refreshFlow() async {
    isWorking = true;
    when((_) => !isWorking, _runRefreshFlow);
  }

  void stop() => _canRun = false;

  void start() {
    _canRun = true;
    _runRefreshFlow(now: true);
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
    await artwork.fetch(track.artwork);
    if (artwork.hasData) {
      await color.fetch(artwork.data);

      if (color.status == DataStatus.success) {
        player.theme.setColors(color.data);
      }
    }
  }

  void _onTrackChange(track) {
    if (isNull(track)) {
      return;
    }

    _fetchArtworkAndColors();
    player.lyrics.fetch(track);

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

    final oldId = track?.id;
    await player.track.fetchCurrentTrack();

    if (track?.id == oldId) {
      isWorking = false;
    }
  }
}
