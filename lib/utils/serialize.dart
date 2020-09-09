import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flyrics/models/serializers/serializers.dart';

T deserialize<T>(dynamic value) =>
    serializers.deserializeWith<T>(serializers.serializerForType(T), value);

T deserializeRaw<T>(String value) => serializers.deserializeWith<T>(
    serializers.serializerForType(T), json.decode(value));

BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<T>(value)).toList(growable: false));
