import 'package:flyrics/modules/store/action.dart';

class SetRefreshTrackTimerAction with ReduxAction {
  final bool payload;

  SetRefreshTrackTimerAction(this.payload);

  @override
  List get args => [payload];
}

class SetCheckIsRunningTimerAction with ReduxAction {
  final bool payload;

  SetCheckIsRunningTimerAction(this.payload);

  @override
  List get args => [payload];
}
