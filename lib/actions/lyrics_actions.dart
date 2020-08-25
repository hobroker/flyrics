import 'package:flyrics/models/lyrics_model.dart';

class FetchLyricsStartAction {
  final String url;

  FetchLyricsStartAction(this.url);
}

class FetchLyricsSuccessAction {
  final String id;
  final LyricsModel result;

  FetchLyricsSuccessAction(this.result, {this.id});
}
