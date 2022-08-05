import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../repository/counter_repository.dart';

Future<Response> countGetHandler(Request request) async {
  return Response.ok(
    const JsonEncoder.withIndent(' ').convert({
      'count': CountRepository.instance.getCount(),
    }),
    headers: {
      'content-type': 'application/json',
      'Cache-Control': 'public, max-age=604800',
      'Access-Control-Allow-Origin': '*',
    },
  );
}
