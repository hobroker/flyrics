// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TrackState extends TrackState {
  @override
  final BuiltMap<String, Track> byId;
  @override
  final String activeId;
  @override
  final String lastActiveId;
  @override
  final bool isLoading;

  factory _$TrackState([void Function(TrackStateBuilder) updates]) =>
      (new TrackStateBuilder()..update(updates)).build();

  _$TrackState._({this.byId, this.activeId, this.lastActiveId, this.isLoading})
      : super._() {
    if (byId == null) {
      throw new BuiltValueNullFieldError('TrackState', 'byId');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('TrackState', 'isLoading');
    }
  }

  @override
  TrackState rebuild(void Function(TrackStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackStateBuilder toBuilder() => new TrackStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackState &&
        byId == other.byId &&
        activeId == other.activeId &&
        lastActiveId == other.lastActiveId &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, byId.hashCode), activeId.hashCode),
            lastActiveId.hashCode),
        isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TrackState')
          ..add('byId', byId)
          ..add('activeId', activeId)
          ..add('lastActiveId', lastActiveId)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class TrackStateBuilder implements Builder<TrackState, TrackStateBuilder> {
  _$TrackState _$v;

  MapBuilder<String, Track> _byId;
  MapBuilder<String, Track> get byId =>
      _$this._byId ??= new MapBuilder<String, Track>();
  set byId(MapBuilder<String, Track> byId) => _$this._byId = byId;

  String _activeId;
  String get activeId => _$this._activeId;
  set activeId(String activeId) => _$this._activeId = activeId;

  String _lastActiveId;
  String get lastActiveId => _$this._lastActiveId;
  set lastActiveId(String lastActiveId) => _$this._lastActiveId = lastActiveId;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  TrackStateBuilder() {
    TrackState._initializeBuilder(this);
  }

  TrackStateBuilder get _$this {
    if (_$v != null) {
      _byId = _$v.byId?.toBuilder();
      _activeId = _$v.activeId;
      _lastActiveId = _$v.lastActiveId;
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrackState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TrackState;
  }

  @override
  void update(void Function(TrackStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TrackState build() {
    _$TrackState _$result;
    try {
      _$result = _$v ??
          new _$TrackState._(
              byId: byId.build(),
              activeId: activeId,
              lastActiveId: lastActiveId,
              isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'byId';
        byId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TrackState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
