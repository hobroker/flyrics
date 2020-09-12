import 'package:json_annotation/json_annotation.dart';

part 'search_item.g.dart';

@JsonSerializable()
class SearchItem {
  final String title;
  final String url;

  SearchItem({this.title, this.url});

  factory SearchItem.fromJson(Map json) => _$SearchItemFromJson(json);

  Map toJson() => _$SearchItemToJson(this);
}
