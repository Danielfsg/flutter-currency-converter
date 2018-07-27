import 'package:flutter_currency_app/common/constants.dart';
import 'package:flutter_currency_app/data/remote.dart';
import 'package:flutter_currency_app/model/rate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

main() {
  group("network testing", () {
    test('http call completes successfully', () async {
      final client = MockClient();

      final response = '{"base":"EUR","date":"2018-07-20"}';
      when(client.get(any)).thenAnswer((_) async =>
          new Future<http.Response>.value(http.Response(response, 200)));

      expect(await fetchLatestRates(client, DEFAULT_BASE),
          const TypeMatcher<ExchangeRate>());
    });

    test('http call completes with and error', () async {
      final client = MockClient();

      when(client.get(any)).thenAnswer((_) async =>
          new Future<http.Response>.value(http.Response("Not Found", 404)));

      expect(fetchLatestRates(client, DEFAULT_BASE), throwsException);
    });
  });
}

class MockClient extends Mock implements http.Client {}
