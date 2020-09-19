// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map json) {
  return Track(
    id: json['id'] as String,
    name: json['name'] as String,
    album: json['album'] as String,
    artist: json['artist'] as String,
    artwork: Track._parseArtwork(json['artwork'] as String),
  );
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album': instance.album,
      'artist': instance.artist,
      'artwork': instance.artwork,
    };
