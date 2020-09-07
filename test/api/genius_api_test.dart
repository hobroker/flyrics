import 'package:flutter_test/flutter_test.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/models/search_result_model.dart';
import 'package:flyrics/modules/config.dart';
import 'package:flyrics/utils/debug.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

Future<http.Response> mockResolvedJson(response) async =>
    http.Response(stringify(response, false), 200);

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  group('GeniusApi', () {
    group('.search()', () {
      test('should return a list with expected search results', () async {
        final client = MockHttpClient();
        when(client.get(any)).thenAnswer((_) async => {
              'response': {
                'hits': [
                  {
                    'result': {'full_title': 'one', 'url': '//one'},
                  },
                  {
                    'result': {'full_title': 'two', 'url': '//two'},
                  },
                ]
              }
            });
        final api = Api(Config({}), client: client);
        final list = await api.genius.search('something');

        expect(
            list,
            equals([
              SearchResultModel(url: '//one', title: 'one'),
              SearchResultModel(url: '//two', title: 'two'),
            ]));

      });

      test('should return an empty list', () async {
        final client = MockHttpClient();
        when(client.get(any)).thenAnswer((_) async => {
              'response': {'hits': []}
            });
        final api = Api(Config({}), client: client);
        final list = await api.genius.search('something');

        expect(list, equals([]));
      });
    });
  });
}
