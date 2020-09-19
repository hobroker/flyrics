import 'package:flutter/foundation.dart';
import 'package:flyrics/services/http_client.dart';

@immutable
class ImageService {
  final HttpClient client;

  const ImageService({
    @required this.client,
  });

  Future<List<int>> getImageBytes(String url) async => client.getBytes(url);
}
