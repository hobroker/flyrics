import 'package:mobx/mobx.dart';

part 'track_state.g.dart';

class TrackState = TrackStateBase with _$TrackState;

abstract class TrackStateBase with Store {
  TrackStateBase();

  @observable
  int count1 = 1;

  @observable
  int count2 = 22;
}
