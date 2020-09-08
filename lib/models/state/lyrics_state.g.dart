// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LyricsState extends LyricsState {
  @override
  final bool isLoading;
  @override
  final BuiltMap<String, LyricsModel> byId;

  factory _$LyricsState([void Function(LyricsStateBuilder) updates]) =>
      (new LyricsStateBuilder()..update(updates)).build();

  _$LyricsState._({this.isLoading, this.byId}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('LyricsState', 'isLoading');
    }
    if (byId == null) {
      throw new BuiltValueNullFieldError('LyricsState', 'byId');
    }
  }

  @override
  LyricsState rebuild(void Function(LyricsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LyricsStateBuilder toBuilder() => new LyricsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LyricsState &&
        isLoading == other.isLoading &&
        byId == other.byId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), byId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LyricsState')
          ..add('isLoading', isLoading)
          ..add('byId', byId))
        .toString();
  }
}

class LyricsStateBuilder implements Builder<LyricsState, LyricsStateBuilder> {
  _$LyricsState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  MapBuilder<String, LyricsModel> _byId;
  MapBuilder<String, LyricsModel> get byId =>
      _$this._byId ??= new MapBuilder<String, LyricsModel>();
  set byId(MapBuilder<String, LyricsModel> byId) => _$this._byId = byId;

  LyricsStateBuilder() {
    LyricsState._initializeBuilder(this);
  }

  LyricsStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _byId = _$v.byId?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LyricsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LyricsState;
  }

  @override
  void update(void Function(LyricsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LyricsState build() {
    _$LyricsState _$result;
    try {
      _$result =
          _$v ?? new _$LyricsState._(isLoading: isLoading, byId: byId.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'byId';
        byId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LyricsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
