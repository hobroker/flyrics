import 'package:flyrics/store/action.dart';

class SetRefreshTrackTimerAction with Action {
  final bool value;

  SetRefreshTrackTimerAction(this.value);

  @override
  String toString() => '${runtimeType}($value)';
}

class SetCheckIsRunningTimerAction with Action {
  final bool isRunning;

  SetCheckIsRunningTimerAction(this.isRunning);

  @override
  String toString() => '${runtimeType}($isRunning)';
}
