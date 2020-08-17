import 'package:flutter/foundation.dart';

@immutable
class Track {
  final String name;
  final String album;
  final String artist;
  final String artwork;

  Track({
    this.name,
    this.album,
    this.artist,
    this.artwork,
  });

  static fromJson(Map json) {
    return Track(
      name: json['name'],
      album: json['album'],
      artist: json['artist'],
      artwork: json['artwork'],
    );
  }
}
