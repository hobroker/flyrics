import 'package:flyrics/modules/store/action.dart';

class CheckIsRunningStartAction with ReduxAction {}

class SetIsRunningAction extends SingleParameterAction<bool> {
  SetIsRunningAction(bool payload) : super(payload);
}
