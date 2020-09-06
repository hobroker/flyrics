import 'package:flyrics/store/action.dart';

class CheckIsRunningStartAction with Action {}

class SetIsRunningAction with Action {
  final bool isRunning;

  SetIsRunningAction(this.isRunning);

  @override
  String toString() => '${runtimeType}($isRunning)';
}
