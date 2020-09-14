import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

@immutable
class HttpClient {
  const HttpClient();

  Future<http.Response> getRaw(uri) => http.get(uri);

  Future<Map> get(uri) async =>
      getRaw(uri).then((res) => res.body).then(_decode);

  Future<List<int>> getBytes(uri) => getRaw(uri).then((res) => res.bodyBytes);

  FutureOr<Map> _decode(value) => json.decode(value);
}
