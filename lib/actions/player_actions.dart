import 'package:flyrics/store/action.dart';

class CheckIsRunningStartAction with ReduxAction {}

class SetIsRunningAction with ReduxAction {
  final bool payload;

  SetIsRunningAction(this.payload);

  @override
  List get args => [payload];
}
