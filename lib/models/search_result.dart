import 'package:flutter/foundation.dart';

@immutable
class SearchResultModel {
  final String title;
  final String url;

  SearchResultModel({this.title, this.url});

  static SearchResultModel fromJson(Map json) {
    return SearchResultModel(
      title: json['full_title'],
      url: json['url'],
    );
  }

  @override
  bool operator ==(other) {
    return other is SearchResultModel &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode => super.hashCode;
}
