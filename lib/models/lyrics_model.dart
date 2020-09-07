import 'package:built_value/built_value.dart';

part 'lyrics_model.g.dart';

abstract class LyricsModel implements Built<LyricsModel, LyricsModelBuilder> {
  @nullable
  String get text;

  String get url;

  LyricsModel._();

  factory LyricsModel([void Function(LyricsModelBuilder) updates]) =
      _$LyricsModel;

  static void _initializeBuilder(LyricsModelBuilder builder) => builder;
}
