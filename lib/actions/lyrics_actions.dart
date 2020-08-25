import 'package:flyrics/models/lyrics_result.dart';

class FetchLyricsStartAction {
  final String url;

  FetchLyricsStartAction(this.url);
}

class FetchLyricsSuccessAction {
  final LyricsResult result;

  FetchLyricsSuccessAction(this.result);
}
