import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../repository/counter_repository.dart';

Future<Response> countPostHandler(Request request) async {
  Map body = await request.readAsString().then(
        (String body) => JsonDecoder().convert(body),
      );

  // TODO: add validators
  CountRepository.instance.setCount(body['count']);

  return Response.ok(
    const JsonEncoder.withIndent(' ').convert({
      'count': body['count'],
    }),
    headers: {
      'content-type': 'application/json',
      'Cache-Control': 'public, max-age=604800',
    },
  );
}
