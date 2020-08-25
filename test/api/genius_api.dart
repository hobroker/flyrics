import 'package:flutter_test/flutter_test.dart';
import 'package:flyrics/api/api.dart';
import 'package:flyrics/models/search_result_model.dart';
import 'package:flyrics/utils/config.dart';
import 'package:flyrics/utils/debug.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';

MockClientHandler mockResolvedJson(response) =>
    (Request request) async => http.Response(stringify(response), 200);

void main() {
  group('GeniusApi', () {
    group('.search()', () {
      test('should return expected search results', () async {
        final client = MockClient(mockResolvedJson({
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
        }));
        var api = Api().init(Config(env: {}), httpClient: client);

        var list = await api.genius.search('something');

        expect(
            list,
            equals([
              SearchResultModel(url: '//one', title: 'one'),
              SearchResultModel(url: '//two', title: 'two'),
            ]));
      });

      test('should return empty result', () async {
        final client = MockClient(mockResolvedJson({
          'response': {'hits': []}
        }));
        var api = Api().init(Config(env: {}), httpClient: client);

        var list = await api.genius.search('something');

        expect(list, equals([]));
      });
    });
  });
}
