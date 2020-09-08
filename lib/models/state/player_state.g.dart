// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PlayerState extends PlayerState {
  @override
  final bool isRunning;

  factory _$PlayerState([void Function(PlayerStateBuilder) updates]) =>
      (new PlayerStateBuilder()..update(updates)).build();

  _$PlayerState._({this.isRunning}) : super._() {
    if (isRunning == null) {
      throw new BuiltValueNullFieldError('PlayerState', 'isRunning');
    }
  }

  @override
  PlayerState rebuild(void Function(PlayerStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayerStateBuilder toBuilder() => new PlayerStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlayerState && isRunning == other.isRunning;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isRunning.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlayerState')
          ..add('isRunning', isRunning))
        .toString();
  }
}

class PlayerStateBuilder implements Builder<PlayerState, PlayerStateBuilder> {
  _$PlayerState _$v;

  bool _isRunning;
  bool get isRunning => _$this._isRunning;
  set isRunning(bool isRunning) => _$this._isRunning = isRunning;

  PlayerStateBuilder() {
    PlayerState._initializeBuilder(this);
  }

  PlayerStateBuilder get _$this {
    if (_$v != null) {
      _isRunning = _$v.isRunning;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlayerState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PlayerState;
  }

  @override
  void update(void Function(PlayerStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlayerState build() {
    final _$result = _$v ?? new _$PlayerState._(isRunning: isRunning);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
