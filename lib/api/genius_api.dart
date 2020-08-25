import 'dart:convert';

import 'package:flyrics/models/search_result.dart';
import 'package:http/http.dart' as http;

class GeniusApi {
  final String accessToken;

  GeniusApi({this.accessToken});

  Future<List<SearchResult>> search(String query) async {
    var uri = Uri.https('api.genius.com', 'search', {
      'q': query,
      'access_token': accessToken,
    });
    var response = await http.get(uri);
    var data = json.decode(response.body);
    var items = data['response']['hits'].map((item) => item['result']);
    var list = List<SearchResult>.from(
        items.map((item) => SearchResult.fromJson(item)));

    return list;
  }

  Future<String> fetchLyrics(String url) async {
    return url;
  }
}
