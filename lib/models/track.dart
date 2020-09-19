import 'package:flutter/foundation.dart';
import 'package:flyrics/utils/debug.dart';
import 'package:flyrics/utils/fp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
@immutable
class Track {
  final String id;
  final String name;
  final String album;
  final String artist;
  @JsonKey(fromJson: Track._parseArtwork)
  final String artwork;

  Track({this.id, this.name, this.album, this.artist, this.artwork});

  factory Track.fromJson(Map json) => _$TrackFromJson(json);

  Map toJson() => _$TrackToJson(this);

  @override
  String toString() => 'Track ${stringify(toJson(), true)}';

  static String _parseArtwork(String url) =>
      isNotNull(url) && url != 'missing value' ? url : null;
}
