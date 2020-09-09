// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ArtworkModel extends ArtworkModel {
  @override
  final List<int> bytes;
  @override
  final List<Color> colors;
  @override
  final Color textColor;
  @override
  final Color dominantColor;
  @override
  final String url;

  factory _$ArtworkModel([void Function(ArtworkModelBuilder) updates]) =>
      (new ArtworkModelBuilder()..update(updates)).build();

  _$ArtworkModel._(
      {this.bytes, this.colors, this.textColor, this.dominantColor, this.url})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('ArtworkModel', 'url');
    }
  }

  @override
  ArtworkModel rebuild(void Function(ArtworkModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtworkModelBuilder toBuilder() => new ArtworkModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtworkModel &&
        bytes == other.bytes &&
        colors == other.colors &&
        textColor == other.textColor &&
        dominantColor == other.dominantColor &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, bytes.hashCode), colors.hashCode),
                textColor.hashCode),
            dominantColor.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArtworkModel')
          ..add('bytes', bytes)
          ..add('colors', colors)
          ..add('textColor', textColor)
          ..add('dominantColor', dominantColor)
          ..add('url', url))
        .toString();
  }
}

class ArtworkModelBuilder
    implements Builder<ArtworkModel, ArtworkModelBuilder> {
  _$ArtworkModel _$v;

  List<int> _bytes;
  List<int> get bytes => _$this._bytes;
  set bytes(List<int> bytes) => _$this._bytes = bytes;

  List<Color> _colors;
  List<Color> get colors => _$this._colors;
  set colors(List<Color> colors) => _$this._colors = colors;

  Color _textColor;
  Color get textColor => _$this._textColor;
  set textColor(Color textColor) => _$this._textColor = textColor;

  Color _dominantColor;
  Color get dominantColor => _$this._dominantColor;
  set dominantColor(Color dominantColor) =>
      _$this._dominantColor = dominantColor;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ArtworkModelBuilder();

  ArtworkModelBuilder get _$this {
    if (_$v != null) {
      _bytes = _$v.bytes;
      _colors = _$v.colors;
      _textColor = _$v.textColor;
      _dominantColor = _$v.dominantColor;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtworkModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArtworkModel;
  }

  @override
  void update(void Function(ArtworkModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArtworkModel build() {
    final _$result = _$v ??
        new _$ArtworkModel._(
            bytes: bytes,
            colors: colors,
            textColor: textColor,
            dominantColor: dominantColor,
            url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
