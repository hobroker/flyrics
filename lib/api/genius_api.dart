import 'dart:convert';

import 'package:flyrics/api/genius_lyrics_parser.dart';
import 'package:flyrics/models/lyrics_result.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class GeniusApi {
  final String accessToken;
  static int MAX_FETCH_LOOPS = 10;
  final String baseUrl = 'api.genius.com';

  GeniusApi({this.accessToken});

  Future<List<SearchResult>> search(String query) async {
    var uri = Uri.https(baseUrl, 'search', {
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
    var html = content['lyrics_data']['body']['html'];
    var $fragment = parseFragment(html);

    var lyricsParser = GeniusLyricsParser(html);
    var parts = lyricsParser.parse();

    return LyricsResult(
      text: $fragment.text,
      tries: loop,
      parts: parts,
    );
  }

  Future<LyricsResult> fetchLyrics(String url) async {
    var result = await _fetchLyricsText(url);

    return result;
  }
}
