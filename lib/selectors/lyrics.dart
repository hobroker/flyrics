import 'package:flyrics/models/app_state.dart';
import 'package:flyrics/models/lyrics_state.dart';

LyricsState getLyrics(AppState state) => state.lyrics;

String getLyricsText(AppState state) => getLyrics(state).text;

bool areLyricsLoading(AppState state) => getLyrics(state).isLoading;

