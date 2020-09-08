// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TimerState extends TimerState {
  @override
  final bool refreshTrack;
  @override
  final bool checkIsRunning;

  factory _$TimerState([void Function(TimerStateBuilder) updates]) =>
      (new TimerStateBuilder()..update(updates)).build();

  _$TimerState._({this.refreshTrack, this.checkIsRunning}) : super._() {
    if (refreshTrack == null) {
      throw new BuiltValueNullFieldError('TimerState', 'refreshTrack');
    }
    if (checkIsRunning == null) {
      throw new BuiltValueNullFieldError('TimerState', 'checkIsRunning');
    }
  }

  @override
  TimerState rebuild(void Function(TimerStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimerStateBuilder toBuilder() => new TimerStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimerState &&
        refreshTrack == other.refreshTrack &&
        checkIsRunning == other.checkIsRunning;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, refreshTrack.hashCode), checkIsRunning.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TimerState')
          ..add('refreshTrack', refreshTrack)
          ..add('checkIsRunning', checkIsRunning))
        .toString();
  }
}

class TimerStateBuilder implements Builder<TimerState, TimerStateBuilder> {
  _$TimerState _$v;

  bool _refreshTrack;
  bool get refreshTrack => _$this._refreshTrack;
  set refreshTrack(bool refreshTrack) => _$this._refreshTrack = refreshTrack;

  bool _checkIsRunning;
  bool get checkIsRunning => _$this._checkIsRunning;
  set checkIsRunning(bool checkIsRunning) =>
      _$this._checkIsRunning = checkIsRunning;

  TimerStateBuilder() {
    TimerState._initializeBuilder(this);
  }

  TimerStateBuilder get _$this {
    if (_$v != null) {
      _refreshTrack = _$v.refreshTrack;
      _checkIsRunning = _$v.checkIsRunning;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimerState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TimerState;
  }

  @override
  void update(void Function(TimerStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TimerState build() {
    final _$result = _$v ??
        new _$TimerState._(
            refreshTrack: refreshTrack, checkIsRunning: checkIsRunning);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
