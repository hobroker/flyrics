import 'package:http/http.dart';

class HttpClient extends BaseClient {
  final _httpClient = Client();

  @override
  Future<StreamedResponse> send(BaseRequest request) =>
      _httpClient.send(request);
}
