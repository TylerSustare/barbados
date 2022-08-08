import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart';
import 'package:test/test.dart';

void runTests(
  void Function(String name, Future<void> Function(String host)) testServer,
) {
  Directory('${Directory.current.path}/bin/db').delete(recursive: true);

  testServer('root', (host) async {
    final response = await get(Uri.parse(host));
    expect(response.statusCode, 200);
    expect(response.body, contains('Flying Fish API Example'));
    expect(response.headers, contains('last-modified'));
    expect(response.headers, contains('date'));
    expect(response.headers, containsPair('content-type', 'text/html'));
  });

  testServer('time', (host) async {
    final response = await get(Uri.parse('$host/time'));
    expect(response.statusCode, 200);
    final serverTime = DateTime.parse(response.body);
    final now = DateTime.now();
    expect(
      serverTime.isAfter(now),
      isFalse,
      reason:
          'Server time ($serverTime) should not be after current time ($now).',
    );
  });

  testServer('404', (host) async {
    var response = await get(Uri.parse('$host/not_here'));
    expect(response.statusCode, 404);
    expect(response.body, 'Route not found');

    response = await post(Uri.parse(host));
    // https://github.com/dart-lang/shelf_static/issues/53 - should 405
    expect(response.statusCode, 200);
    expect(response.body, contains('pkg:shelf example'));
  });

  group('count', () {
    testServer('get', (host) async {
      final response = await get(Uri.parse('$host/count'));
      expect(response.statusCode, 200);
      var data = jsonDecode(response.body);
      expect(data['count'], 0);
    });

    testServer('increment', (host) async {
      final response = await get(Uri.parse('$host/count'));
      var data = jsonDecode(response.body);
      expect(data['count'], 0);

      final randomNumber = Random().nextInt(1000);
      final res = await post(
        Uri.parse('$host/count'),
        body: jsonEncode(
          {'count': randomNumber},
        ),
      );
      expect(res.statusCode, 200);

      final r = await get(Uri.parse('$host/count'));
      var count = jsonDecode(r.body);
      expect(count['count'], randomNumber);
    });
  });
}
