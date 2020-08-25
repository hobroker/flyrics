import 'package:flyrics/models/lyrics_model.dart';

class SetLyricsLoadingAction {
  @override
  String toString() => '${SetLyricsLoadingAction}()';
}

class FetchLyricsStartAction {
  final String url;

  FetchLyricsStartAction(this.url);

  @override
  String toString() => '${FetchLyricsStartAction}($url)';
}

class FetchLyricsSuccessAction {
  final String id;
  final LyricsModel result;

  FetchLyricsSuccessAction(this.result, {this.id});

  @override
  String toString() => '${FetchLyricsSuccessAction}(..., id: $id)';
}
