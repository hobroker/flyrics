import 'package:flyrics/modules/store/action.dart';

class AppStartedAction with ReduxAction {}

class OpenUrlAction with ReduxAction {
  final String url;

  OpenUrlAction(this.url);

  @override
  String toString() => '${runtimeType}($url)';
}
