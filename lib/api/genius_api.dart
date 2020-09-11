import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/utils/serialize.dart';
import 'package:html/parser.dart';

class GeniusApi {
  final String accessToken;
  static final int _MAX_FETCH_LOOPS = 10;
  final String baseUrl = 'api.genius.com';
  final HttpClient client;

  GeniusApi(this.client, {this.accessToken});

  Future<BuiltList<SearchResult>> search(String query) async {
    final uri = Uri.https(baseUrl, 'search', {
      'q': query,
      'access_token': accessToken,
    });
    final data = await client.get(uri);
    final items = data['response']['hits'].map((item) => item['result']);
    final list = deserializeListOf<SearchResult>(items);

    return list;
  }

  Future<List<SearchResult>> search2(String query) =>
      search(query).then((results) => results.toList(growable: false));

  Future<String> _fetchLyricsText(url, {int loop = 0}) async {
    loop++;

    final response = await client.getRaw(url);
    final document = parse(response.body);
    final $pageData = document.querySelector('meta[itemprop="page_data"]');

    if ($pageData == null) {
      if (loop == GeniusApi._MAX_FETCH_LOOPS) {
        throw Exception(
            'no page data after ${GeniusApi._MAX_FETCH_LOOPS} tries');
      }

      return _fetchLyricsText(url, loop: loop);
    }

    final content = json.decode($pageData.attributes['content']);
    final html = content['lyrics_data']['body']['html'];
    final $fragment = parseFragment(html);
    final text = $fragment.text.replaceAll(RegExp(r'\s+$'), '');

    return text;
  }

  Future<String> fetchLyrics(String url) async {
    var result = await _fetchLyricsText(url);

    return result;
  }
}
