import 'package:flutter/foundation.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/artwork_model.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/states/track_store.dart';
import 'package:mobx/mobx.dart';

part 'player_store.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  bool isRunning = false;

  @observable
  ArtworkModel artwork;

  final TrackStore trackStore;

  PlayerStoreBase({
    @required this.trackStore,
  });

  @action
  Future fetchIsRunning() async {
    isRunning = await I<Api>().spotify.isRunning();

    await trackStore.fetchCurrentTrack();
  }
}
