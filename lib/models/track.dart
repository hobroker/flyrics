import 'package:flutter/foundation.dart';

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

  static fromJson(Map json) {
    return Track(
      id: json['id'],
      name: json['name'],
      album: json['album'],
      artist: json['artist'],
      artwork: json['artwork'],
    );
  }

  bool operator ==(other) {
    return (other is Track && other.id == id);
  }

  @override
  int get hashCode => super.hashCode;
}
