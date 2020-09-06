import 'package:flyrics/models/track_model.dart';
import 'package:flyrics/store/action.dart';

class FetchTrackStartAction with ReduxAction {}

class CheckTrackAction with ReduxAction {}

class FetchTrackSuccessAction with ReduxAction {
  final TrackModel track;

  FetchTrackSuccessAction(this.track);

  @override
  List get args => [track];
}

class SaveLastActiveIdAction with ReduxAction {
  final String activeId;

  SaveLastActiveIdAction(this.activeId);

  @override
  List get args => [activeId];
}

class ResetActiveIdAction with ReduxAction {}
