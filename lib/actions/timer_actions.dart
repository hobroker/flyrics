import 'package:flyrics/store/action.dart';

class SetRefreshTrackTimerAction with Action {
  final bool value;

  SetRefreshTrackTimerAction(this.value);

  @override
  String toString() => '${runtimeType}($value)';
}

class SetCheckIsRunningTimerAction with Action {
  final bool value;

  SetCheckIsRunningTimerAction(this.value);

  @override
  String toString() => '${runtimeType}($value)';
}
