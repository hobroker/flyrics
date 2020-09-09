import 'package:built_value/built_value.dart';
import 'package:flyrics/models/state/artwork_state.dart';
import 'package:flyrics/models/state/lyrics_state.dart';
import 'package:flyrics/models/state/player_state.dart';
import 'package:flyrics/models/state/search_state.dart';
import 'package:flyrics/models/state/timer_state.dart';
import 'package:flyrics/models/state/track_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  PlayerState get player;

  TrackState get track;

  ArtworkState get artwork;

  SearchState get search;

  LyricsState get lyrics;

  TimerState get timer;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  static void _initializeBuilder(AppStateBuilder builder) => builder;
}
