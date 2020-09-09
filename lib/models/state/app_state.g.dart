// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final PlayerState player;
  @override
  final TrackState track;
  @override
  final ArtworkState artwork;
  @override
  final SearchState search;
  @override
  final LyricsState lyrics;
  @override
  final TimerState timer;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.player,
      this.track,
      this.artwork,
      this.search,
      this.lyrics,
      this.timer})
      : super._() {
    if (player == null) {
      throw new BuiltValueNullFieldError('AppState', 'player');
    }
    if (track == null) {
      throw new BuiltValueNullFieldError('AppState', 'track');
    }
    if (artwork == null) {
      throw new BuiltValueNullFieldError('AppState', 'artwork');
    }
    if (search == null) {
      throw new BuiltValueNullFieldError('AppState', 'search');
    }
    if (lyrics == null) {
      throw new BuiltValueNullFieldError('AppState', 'lyrics');
    }
    if (timer == null) {
      throw new BuiltValueNullFieldError('AppState', 'timer');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        player == other.player &&
        track == other.track &&
        artwork == other.artwork &&
        search == other.search &&
        lyrics == other.lyrics &&
        timer == other.timer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, player.hashCode), track.hashCode),
                    artwork.hashCode),
                search.hashCode),
            lyrics.hashCode),
        timer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('player', player)
          ..add('track', track)
          ..add('artwork', artwork)
          ..add('search', search)
          ..add('lyrics', lyrics)
          ..add('timer', timer))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  PlayerStateBuilder _player;
  PlayerStateBuilder get player => _$this._player ??= new PlayerStateBuilder();
  set player(PlayerStateBuilder player) => _$this._player = player;

  TrackStateBuilder _track;
  TrackStateBuilder get track => _$this._track ??= new TrackStateBuilder();
  set track(TrackStateBuilder track) => _$this._track = track;

  ArtworkStateBuilder _artwork;
  ArtworkStateBuilder get artwork =>
      _$this._artwork ??= new ArtworkStateBuilder();
  set artwork(ArtworkStateBuilder artwork) => _$this._artwork = artwork;

  SearchStateBuilder _search;
  SearchStateBuilder get search => _$this._search ??= new SearchStateBuilder();
  set search(SearchStateBuilder search) => _$this._search = search;

  LyricsStateBuilder _lyrics;
  LyricsStateBuilder get lyrics => _$this._lyrics ??= new LyricsStateBuilder();
  set lyrics(LyricsStateBuilder lyrics) => _$this._lyrics = lyrics;

  TimerStateBuilder _timer;
  TimerStateBuilder get timer => _$this._timer ??= new TimerStateBuilder();
  set timer(TimerStateBuilder timer) => _$this._timer = timer;

  AppStateBuilder() {
    AppState._initializeBuilder(this);
  }

  AppStateBuilder get _$this {
    if (_$v != null) {
      _player = _$v.player?.toBuilder();
      _track = _$v.track?.toBuilder();
      _artwork = _$v.artwork?.toBuilder();
      _search = _$v.search?.toBuilder();
      _lyrics = _$v.lyrics?.toBuilder();
      _timer = _$v.timer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              player: player.build(),
              track: track.build(),
              artwork: artwork.build(),
              search: search.build(),
              lyrics: lyrics.build(),
              timer: timer.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
        _$failedField = 'track';
        track.build();
        _$failedField = 'artwork';
        artwork.build();
        _$failedField = 'search';
        search.build();
        _$failedField = 'lyrics';
        lyrics.build();
        _$failedField = 'timer';
        timer.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
