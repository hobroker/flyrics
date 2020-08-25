import 'package:http/http.dart' as http;

class UtilApi {
  Future<List<int>> getBytes(String url) async {
    var response = await http.get(url);

    return response.bodyBytes;
  }
}
