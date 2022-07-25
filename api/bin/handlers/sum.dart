import 'dart:convert';

import 'package:shelf/shelf.dart';

Response sumHandler(request, String a, String b) {
  final aNum = int.parse(a);
  final bNum = int.parse(b);
  return Response.ok(
    const JsonEncoder.withIndent(' ').convert({
      'a': aNum,
      'b': bNum,
      'sum': aNum + bNum,
    }),
    headers: {
      'content-type': 'application/json',
      'Cache-Control': 'public, max-age=604800',
    },
  );
}
