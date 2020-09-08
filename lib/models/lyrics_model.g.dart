// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LyricsModel extends LyricsModel {
  @override
  final String text;
  @override
  final String url;

  factory _$LyricsModel([void Function(LyricsModelBuilder) updates]) =>
      (new LyricsModelBuilder()..update(updates)).build();

  _$LyricsModel._({this.text, this.url}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('LyricsModel', 'url');
    }
  }

  @override
  LyricsModel rebuild(void Function(LyricsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LyricsModelBuilder toBuilder() => new LyricsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LyricsModel && text == other.text && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, text.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LyricsModel')
          ..add('text', text)
          ..add('url', url))
        .toString();
  }
}

class LyricsModelBuilder implements Builder<LyricsModel, LyricsModelBuilder> {
  _$LyricsModel _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  LyricsModelBuilder() {
    LyricsModel._initializeBuilder(this);
  }

  LyricsModelBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LyricsModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LyricsModel;
  }

  @override
  void update(void Function(LyricsModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LyricsModel build() {
    final _$result = _$v ?? new _$LyricsModel._(text: text, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
