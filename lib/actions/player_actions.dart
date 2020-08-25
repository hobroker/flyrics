class CheckIsRunningStartAction {}

class SetIsRunningAction {
  final bool isRunning;

  SetIsRunningAction(this.isRunning);

  @override
  String toString() => '${SetIsRunningAction}($isRunning)';
}
