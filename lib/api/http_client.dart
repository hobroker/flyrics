import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class HttpClient {
  const HttpClient();

  Future<http.Response> getRaw(uri) => http.get(uri);

  Future<Map> get(uri) async {
    var response = await getRaw(uri);

    return json.decode(response.body);
  }

  Future<List<int>> getBytes(uri) async {
    var response = await getRaw(uri);

    return response.bodyBytes;
  }
}
