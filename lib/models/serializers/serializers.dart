import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/models/track.dart';

part 'serializers.g.dart';

@SerializersFor([
  SearchResult,
  Track,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();
