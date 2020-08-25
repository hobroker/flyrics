import 'dart:convert';

import 'package:flyrics/models/lyrics_model.dart';
import 'package:flyrics/models/search_result_model.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class GeniusApi {
  final String accessToken;
  static int MAX_FETCH_LOOPS = 10;
  final String baseUrl = 'api.genius.com';

  GeniusApi({this.accessToken});

  Future<List<SearchResultModel>> search(String query) async {
    var uri = Uri.https(baseUrl, 'search', {
      'q': query,
      'access_token': accessToken,
    });
    var response = await http.get(uri);
    var data = json.decode(response.body);
    var items = data['response']['hits'].map((item) => item['result']);
    var list = List<SearchResultModel>.from(
        items.map((item) => SearchResultModel.fromJson(item)));

    return list;
  }

  Future<LyricsModel> _fetchLyricsText(url, {int loop = 0}) async {
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
    var text = $fragment.text.replaceAll(RegExp(r'\s+$'), '');

    return LyricsModel(
      text: text,
    );
  }

  Future<LyricsModel> fetchLyrics(String url) async {
    var result = await _fetchLyricsText(url);

    return result;
  }
}
