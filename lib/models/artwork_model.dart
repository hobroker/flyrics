import 'package:built_value/built_value.dart';
import 'package:flutter/painting.dart';

part 'artwork_model.g.dart';

abstract class ArtworkModel
    implements Built<ArtworkModel, ArtworkModelBuilder> {
  List<int> get bytes;

  List<Color> get colors;

  @nullable
  Color get textColor;

  @nullable
  Color get dominantColor;

  String get url;

  ArtworkModel._();

  factory ArtworkModel([void Function(ArtworkModelBuilder) updates]) =
      _$ArtworkModel;
}
