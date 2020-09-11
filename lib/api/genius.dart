import 'dart:convert';

import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/models/search_item.dart';
import 'package:html/parser.dart';

class GeniusService {
  final String accessToken;
  static final int _MAX_FETCH_LOOPS = 10;
  final String baseUrl = 'api.genius.com';
  final HttpClient client;

  GeniusService({this.client, this.accessToken});

  Future<List<SearchItem>> search(String query) async {
    final uri = Uri.https(baseUrl, 'search', {
      'q': query,
      'access_token': accessToken,
    });
    final data = await client.get(uri);
    final items = data['response']['hits'].map((item) => item['result']);
    final list =
        List<SearchItem>.from(items.map((item) => SearchItem.fromJson(item)));

    return list;
  }

  Future<String> _fetchLyricsText(url, {int loop = 0}) async {
    loop++;

    final response = await client.getRaw(url);
    final document = parse(response.body);
    final $pageData = document.querySelector('meta[itemprop="page_data"]');

    if ($pageData == null) {
      if (loop == GeniusService._MAX_FETCH_LOOPS) {
        throw Exception(
            'no page data after ${GeniusService._MAX_FETCH_LOOPS} tries');
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
