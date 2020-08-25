import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/store/action.dart';

class SetLyricsLoadingAction with Action {}

class FetchLyricsStartAction with Action {
  final String url;

  FetchLyricsStartAction(this.url);

  @override
  String toString() => '${runtimeType}($url)';
}

class FetchLyricsSuccessAction with Action {
  final String id;
  final LyricsModel result;

  FetchLyricsSuccessAction(this.result, {this.id});

  @override
  String toString() => '${runtimeType}(..., id: $id)';
}
