import 'package:shelf/shelf.dart';

Response timeHandler(Request request) => Response.ok(
      DateTime.now().toUtc().toIso8601String(),
    );
