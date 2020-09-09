import 'package:flyrics/modules/store/action.dart';

class SetRefreshTrackTimerAction extends SingleParameterAction<bool> {
  SetRefreshTrackTimerAction(bool payload) : super(payload);
}

class SetCheckIsRunningTimerAction extends SingleParameterAction<bool> {
  SetCheckIsRunningTimerAction(bool payload) : super(payload);
}
