import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flyrics/models/track.dart';

part 'track_state.g.dart';

abstract class TrackState implements Built<TrackState, TrackStateBuilder> {
  BuiltMap<String, Track> get byId;

  @nullable
  String get activeId;

  @nullable
  String get lastActiveId;

  bool get isLoading;

  TrackState._();

  factory TrackState([void Function(TrackStateBuilder) updates]) = _$TrackState;

  static void _initializeBuilder(TrackStateBuilder builder) =>
      builder..isLoading = false;
}
