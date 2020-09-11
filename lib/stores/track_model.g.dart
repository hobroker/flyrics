// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackModelStore _$TrackModelStoreFromJson(Map<String, dynamic> json) {
  return TrackModelStore()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..album = json['album'] as String
    ..artist = json['artist'] as String
    ..artwork = json['artwork'] as String;
}

Map<String, dynamic> _$TrackModelStoreToJson(TrackModelStore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album': instance.album,
      'artist': instance.artist,
      'artwork': instance.artwork,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrackModelStore on TrackModelStoreBase, Store {
  final _$nameAtom = Atom(name: 'TrackModelStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$albumAtom = Atom(name: 'TrackModelStoreBase.album');

  @override
  String get album {
    _$albumAtom.reportRead();
    return super.album;
  }

  @override
  set album(String value) {
    _$albumAtom.reportWrite(value, super.album, () {
      super.album = value;
    });
  }

  final _$artistAtom = Atom(name: 'TrackModelStoreBase.artist');

  @override
  String get artist {
    _$artistAtom.reportRead();
    return super.artist;
  }

  @override
  set artist(String value) {
    _$artistAtom.reportWrite(value, super.artist, () {
      super.artist = value;
    });
  }

  final _$artworkAtom = Atom(name: 'TrackModelStoreBase.artwork');

  @override
  String get artwork {
    _$artworkAtom.reportRead();
    return super.artwork;
  }

  @override
  set artwork(String value) {
    _$artworkAtom.reportWrite(value, super.artwork, () {
      super.artwork = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
album: ${album},
artist: ${artist},
artwork: ${artwork}
    ''';
  }
}
