import 'package:flutter/foundation.dart';
import 'package:flyrics/utils/debug.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_item.g.dart';

@JsonSerializable()
@immutable
class SearchItem {
  @JsonKey(name: 'full_title')
  final String title;

  final String url;

  SearchItem({this.title, this.url});

  factory SearchItem.fromJson(Map json) => _$SearchItemFromJson(json);

  Map toJson() => _$SearchItemToJson(this);

  @override
  String toString() => 'SearchItem ${stringify(toJson(), true)}';
}
