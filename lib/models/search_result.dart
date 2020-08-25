import 'package:flutter/foundation.dart';

@immutable
class SearchResult {
  final String title;
  final String url;

  SearchResult({this.title, this.url});

  static fromJson(Map json) {
    return SearchResult(
      title: json['full_title'],
      url: json['url'],
    );
  }

  bool operator ==(other) {
    return other is SearchResult && other.title == title && other.url == url;
  }

  @override
  int get hashCode => super.hashCode;
}
