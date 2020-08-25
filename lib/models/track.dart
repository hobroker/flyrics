import 'package:flutter/foundation.dart';
import 'package:flyrics/utils/debug.dart';

@immutable
class Track {
  final String id;
  final String name;
  final String album;
  final String artist;
  final String artwork;

  const Track({
    this.id,
    this.name,
    this.album,
    this.artist,
    this.artwork,
  });

  static Track fromJson(Map json) {
    return Track(
      id: json['id'],
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

  bool isEmpty() => id == null;

  @override
  bool operator ==(other) {
    return (other is Track && other.id == id);
  }

  @override
  int get hashCode => super.hashCode;
}
