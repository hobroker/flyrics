import 'package:flyrics/store/action.dart';

class CheckIsRunningStartAction with ReduxAction {}

class SetIsRunningAction with ReduxAction {
  final bool isRunning;

  SetIsRunningAction(this.isRunning);

  @override
  List get args => [isRunning];
}
