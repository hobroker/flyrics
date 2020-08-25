import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/lyrics.dart';
import 'package:flyrics/models/new/lyrics_state.dart';
import 'package:flyrics/selectors/track.dart';

LyricsState getLyricsState(AppState state) => state.lyrics;

Map getLyricsById(AppState state) => state.lyrics.byId;

LyricsModel getActiveLyrics(AppState state) {
  var activeId = getActiveTrackId(state);

  return getLyricsById(state)[activeId];
}

String getLyricsText(AppState state) => getActiveLyrics(state)?.text;

bool hasActiveTrackLyrics(AppState state) => getLyricsText(state) != null;

bool areLyricsLoading(AppState state) => getLyricsState(state).isLoading;
