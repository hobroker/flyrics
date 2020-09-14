import 'dart:convert';

import 'package:flyrics/api/http_client.dart';
import 'package:html/parser.dart';

class GeniusService {
  final String accessToken;
  static final int _MAX_FETCH_LOOPS = 10;
  final String baseUrl = 'api.genius.com';
  final HttpClient client;

  GeniusService({this.client, this.accessToken});

  Future<List<Map>> search(String query) async {
    final uri = Uri.https(baseUrl, 'search', {
      'q': query,
      'access_token': accessToken,
    });
    final data = await client.get(uri);
    final items =
        List<Map>.from(data['response']['hits'].map((item) => item['result']));

    return items;
  }

  Future<String> _fetchLyricsText(url, {int loop = 0}) async {
    loop++;

    if (loop == GeniusService._MAX_FETCH_LOOPS) {
      throw Exception('loop limit reached');
    }

    try {
      final response = await client.getRaw(url);
      final document = parse(response.body);
      final $pageData = document.querySelector('meta[itemprop="page_data"]');

      if ($pageData == null) {
        throw Exception();
      }

      final content = json.decode($pageData.attributes['content']);
      final html = content['lyrics_data']['body']['html'];
      final $fragment = parseFragment(html);
      final text = $fragment.text.replaceAll(RegExp(r'\s+$'), '');

      return text;
    } catch (e) {
      return _fetchLyricsText(url, loop: loop);
    }
  }

  Future<String> fetchLyrics(String url) async {
    try {
      final result = await _fetchLyricsText(url);

      return result;
    } catch (e) {
      throw Exception(
          'no lyrics after ${GeniusService._MAX_FETCH_LOOPS} tries');
    }
  }
}
