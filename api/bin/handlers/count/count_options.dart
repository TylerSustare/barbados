import 'package:shelf/shelf.dart';

Future<Response> countOptionsHandler(Request request) async {
  return Response.ok(
    {}.toString(),
    headers: {
      'Cache-Control': 'public, max-age=604800',
      'Access-Control-Request-Methods': 'GET, POST',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Headers':
          'Origin, X-Requested-With, Content-Type, Accept'
    },
  );
}
