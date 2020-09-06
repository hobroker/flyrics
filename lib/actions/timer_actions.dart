import 'package:flyrics/store/action.dart';

class SetRefreshTrackTimerAction with ReduxAction {
  final bool value;

  SetRefreshTrackTimerAction(this.value);

  @override
  List get args => [value];
}

class SetCheckIsRunningTimerAction with ReduxAction {
  final bool isRunning;

  SetCheckIsRunningTimerAction(this.isRunning);

  @override
  List get args => [isRunning];
}
