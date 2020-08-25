import 'package:flutter/foundation.dart';
import 'package:flyrics/utils/debug.dart';

@immutable
class TrackModel {
  final String id;
  final String name;
  final String album;
  final String artist;
  final String artwork;

  const TrackModel({
    this.id,
    this.name,
    this.album,
    this.artist,
    this.artwork,
  });

  static TrackModel fromJson(Map json) {
    return TrackModel(
      id: json['id'].replaceFirst('spotify:track:', ''),
      name: json['name'],
      album: json['album'],
      artist: json['artist'],
      artwork: json['artwork'] == 'missing value' ? null : json['artwork'],
    );
  }

  @override
  String toString() {
    return stringify({
      'id': id,
      'name': name,
      'album': album,
      'artist': artist,
      'artwork': artwork,
    }, true);
  }

  @override
  bool operator ==(other) {
    return (other is TrackModel && other.id == id);
  }

  @override
  int get hashCode => super.hashCode;
}
