import 'package:flyrics/models/track_model.dart';

class FetchTrackStartAction {
  @override
  String toString() => '${FetchTrackStartAction}()';
}

class CheckTrackAction {
  @override
  String toString() => '${CheckTrackAction}()';
}

class FetchTrackSuccessAction {
  final TrackModel track;

  FetchTrackSuccessAction(this.track);

  @override
  String toString() => '${FetchTrackStartAction}($track)';
}

class ResetActiveIdAction {
  @override
  String toString() => '${ResetActiveIdAction}()';
}
