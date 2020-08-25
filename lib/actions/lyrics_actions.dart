import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/store/action.dart';

class SetLyricsLoadingAction with Action {}

class FetchLyricsStartAction with Action {
  final String url;
  final String id;

  FetchLyricsStartAction(this.url, {this.id});

  @override
  String toString() => '${runtimeType}($url, id: $id)';
}

class FetchLyricsSuccessAction with Action {
  final String id;
  final String text;

  FetchLyricsSuccessAction(this.text, {this.id});

  @override
  String toString() => '${runtimeType}("...", id: $id)';
}
