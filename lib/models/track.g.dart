// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Track> _$trackSerializer = new _$TrackSerializer();

class _$TrackSerializer implements StructuredSerializer<Track> {
  @override
  final Iterable<Type> types = const [Track, _$Track];
  @override
  final String wireName = 'Track';

  @override
  Iterable<Object> serialize(Serializers serializers, Track object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'album',
      serializers.serialize(object.album,
          specifiedType: const FullType(String)),
      'artist',
      serializers.serialize(object.artist,
          specifiedType: const FullType(String)),
      'artwork',
      serializers.serialize(object.artwork,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Track deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'album':
          result.album = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'artist':
          result.artist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'artwork':
          result.artwork = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Track extends Track {
  @override
  final String id;
  @override
  final String name;
  @override
  final String album;
  @override
  final String artist;
  @override
  final String artwork;

  factory _$Track([void Function(TrackBuilder) updates]) =>
      (new TrackBuilder()..update(updates)).build();

  _$Track._({this.id, this.name, this.album, this.artist, this.artwork})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Track', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Track', 'name');
    }
    if (album == null) {
      throw new BuiltValueNullFieldError('Track', 'album');
    }
    if (artist == null) {
      throw new BuiltValueNullFieldError('Track', 'artist');
    }
    if (artwork == null) {
      throw new BuiltValueNullFieldError('Track', 'artwork');
    }
  }

  @override
  Track rebuild(void Function(TrackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackBuilder toBuilder() => new TrackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Track &&
        id == other.id &&
        name == other.name &&
        album == other.album &&
        artist == other.artist &&
        artwork == other.artwork;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), album.hashCode),
            artist.hashCode),
        artwork.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Track')
          ..add('id', id)
          ..add('name', name)
          ..add('album', album)
          ..add('artist', artist)
          ..add('artwork', artwork))
        .toString();
  }
}

class TrackBuilder implements Builder<Track, TrackBuilder> {
  _$Track _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _album;
  String get album => _$this._album;
  set album(String album) => _$this._album = album;

  String _artist;
  String get artist => _$this._artist;
  set artist(String artist) => _$this._artist = artist;

  String _artwork;
  String get artwork => _$this._artwork;
  set artwork(String artwork) => _$this._artwork = artwork;

  TrackBuilder() {
    Track._initializeBuilder(this);
  }

  TrackBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _album = _$v.album;
      _artist = _$v.artist;
      _artwork = _$v.artwork;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Track other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Track;
  }

  @override
  void update(void Function(TrackBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Track build() {
    final _$result = _$v ??
        new _$Track._(
            id: id, name: name, album: album, artist: artist, artwork: artwork);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
