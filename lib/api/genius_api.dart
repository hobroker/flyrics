import 'dart:convert';

import 'package:flyrics/models/lyrics_result.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class GeniusApi {
  final String accessToken;
  static int MAX_FETCH_LOOPS = 10;

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

  Future<LyricsResult> _fetchLyricsText(url, {int loop = 0}) async {
    loop++;

    var response = await http.get(url);
    var document = parse(response.body);
    var $pageData = document.querySelector('meta[itemprop="page_data"]');

    if ($pageData == null) {
      if (loop == GeniusApi.MAX_FETCH_LOOPS) {
        throw Exception(
            'no page data after ${GeniusApi.MAX_FETCH_LOOPS} tries');
      }

      return _fetchLyricsText(url, loop: loop);
    }

    var content = json.decode($pageData.attributes['content']);
    var html = parseFragment(content['lyrics_data']['body']['html']);

    var text = html.text;

    return LyricsResult(text: text, tries: loop);
  }

  Future<LyricsResult> fetchLyrics(String url) async {
    var result = await _fetchLyricsText(url);

    print(result.tries);

    return result;
  }
}
