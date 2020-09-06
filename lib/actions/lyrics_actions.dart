import 'package:flyrics/store/action.dart';

class SetLyricsLoadingAction with ReduxAction {}

class FetchLyricsStartAction with ReduxAction {
  final String url;
  final String id;

  FetchLyricsStartAction(this.url, {this.id});

  @override
  List get args => [url, id];
}

class FetchLyricsSuccessAction with ReduxAction {
  final String id;
  final String text;

  FetchLyricsSuccessAction(this.text, {this.id});

  @override
  List get args => ['"..."', id];
}
