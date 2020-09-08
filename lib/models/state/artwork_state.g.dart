// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ArtworkState extends ArtworkState {
  @override
  final bool isLoading;
  @override
  final BuiltMap<String, ArtworkModel> byId;

  factory _$ArtworkState([void Function(ArtworkStateBuilder) updates]) =>
      (new ArtworkStateBuilder()..update(updates)).build();

  _$ArtworkState._({this.isLoading, this.byId}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('ArtworkState', 'isLoading');
    }
    if (byId == null) {
      throw new BuiltValueNullFieldError('ArtworkState', 'byId');
    }
  }

  @override
  ArtworkState rebuild(void Function(ArtworkStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtworkStateBuilder toBuilder() => new ArtworkStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtworkState &&
        isLoading == other.isLoading &&
        byId == other.byId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), byId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArtworkState')
          ..add('isLoading', isLoading)
          ..add('byId', byId))
        .toString();
  }
}

class ArtworkStateBuilder
    implements Builder<ArtworkState, ArtworkStateBuilder> {
  _$ArtworkState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  MapBuilder<String, ArtworkModel> _byId;
  MapBuilder<String, ArtworkModel> get byId =>
      _$this._byId ??= new MapBuilder<String, ArtworkModel>();
  set byId(MapBuilder<String, ArtworkModel> byId) => _$this._byId = byId;

  ArtworkStateBuilder() {
    ArtworkState._initializeBuilder(this);
  }

  ArtworkStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _byId = _$v.byId?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtworkState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArtworkState;
  }

  @override
  void update(void Function(ArtworkStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArtworkState build() {
    _$ArtworkState _$result;
    try {
      _$result =
          _$v ?? new _$ArtworkState._(isLoading: isLoading, byId: byId.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'byId';
        byId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArtworkState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
