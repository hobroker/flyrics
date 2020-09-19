import 'package:flutter_test/flutter_test.dart';
import 'package:flyrics/constants/env.dart';
import 'package:flyrics/services/config.dart';
import 'package:flyrics/services/genius.dart';
import 'package:flyrics/services/http_client.dart';
import 'package:flyrics/utils/debug.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

Future<http.Response> mockResolvedJson(response) async =>
    http.Response(stringify(response, false), 200);

// ignore: must_be_immutable
class MockHttpClient extends Mock implements HttpClient {}

final config = ConfigService({
  GENIUS_API_KEY: '',
});

void main() {
  group('GeniusApi', () {
    final wrapGenius = (response) {
      final client = MockHttpClient();
      when(client.get(any)).thenAnswer((_) async => response);
      return GeniusService(
        client: client,
        config: config,
      );
    };

    group('.search()', () {
      test('should return a list with expected search results', () async {
        final items = [
          {'url': '//one', 'full_title': 'one'},
          {'url': '//two', 'full_title': 'two'},
        ];
        final genius = wrapGenius({
          'response': {
            'hits': items.map((item) => {'result': item})
          }
        });
        final list = await genius.search('something');

        expect(list, equals(items));
      });

      test('should return an empty list', () async {
        final genius = wrapGenius({
          'response': {'hits': []}
        });
        final list = await genius.search('something');

        expect(list, equals([]));
      });
    });
  });
}
