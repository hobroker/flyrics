import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flyrics/models/artwork_model.dart';

part 'artwork_state.g.dart';

abstract class ArtworkState
    implements Built<ArtworkState, ArtworkStateBuilder> {
  bool get isLoading;

  BuiltMap<String, ArtworkModel> get byId;

  ArtworkState._();

  factory ArtworkState([void Function(ArtworkStateBuilder) updates]) =
      _$ArtworkState;

  static void _initializeBuilder(ArtworkStateBuilder builder) =>
      builder..isLoading = false;
}
