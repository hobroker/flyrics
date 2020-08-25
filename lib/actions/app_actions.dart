import 'package:flyrics/store/action.dart';

class AppStartedAction with Action {}

class OpenUrlAction with Action {
  final String url;

  OpenUrlAction(this.url);

  @override
  String toString() => '${runtimeType}($url)';
}
