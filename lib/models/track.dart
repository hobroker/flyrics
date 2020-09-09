import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'track.g.dart';

abstract class Track implements Built<Track, TrackBuilder> {
  String get id;

  String get name;

  String get album;

  String get artist;

  String get artwork;

  Track._();

  factory Track([void Function(TrackBuilder) updates]) = _$Track;

  static Serializer<Track> get serializer => _$trackSerializer;

  static void _initializeBuilder(TrackBuilder builder) => builder;
}
