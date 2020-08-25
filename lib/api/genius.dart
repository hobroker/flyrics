import 'package:flyrics/api/shell.dart';
import 'package:flyrics/models/search_result.dart';
import 'package:flyrics/utils/secrets.dart';
import 'package:http/http.dart' as http;

class Genius {
  final shell = new Shell();

  get accessToken => Secrets.getEnv('GENIUS_API_KEY');

  static Future<List<SearchResult>> search(String query) async {
    var uri = Uri.https('https://api.genius.com', '/search', {
      'q': query,
      'access_token': '',
    });
    var response = await http.get(uri);
    print(response);
    return [];
  }

  static Future<String> getLyrics(String url) async {
    return '[]';
  }
}
