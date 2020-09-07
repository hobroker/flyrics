import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flyrics/models/lyrics_model.dart';

part 'lyrics_state.g.dart';

abstract class LyricsState implements Built<LyricsState, LyricsStateBuilder> {
  bool get isLoading;

  BuiltMap<String, LyricsModel> get byId;

  LyricsState._();

  factory LyricsState([void Function(LyricsStateBuilder) updates]) =
      _$LyricsState;

  static void _initializeBuilder(LyricsStateBuilder builder) =>
      builder..isLoading = false;
}
