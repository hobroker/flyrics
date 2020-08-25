import 'package:http/http.dart' as http;

class Http {
  static Future<List<int>> fetchImageBytes(String url) async {
    var response = await http.get(url);

    return response.bodyBytes;
  }
}
