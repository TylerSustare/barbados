import 'dart:io';

import 'package:hotreloader/hotreloader.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'handlers/static.dart';
import 'router/router.dart';

Future main() async {
  if (Platform.environment['ENV'] == 'dev') {
    await HotReloader.create(
      onAfterReload: (ctx) => print('Hot-reload result: ${ctx.result}'),
    );
  }
  // If the "PORT" environment variable is set, listen to it. Otherwise, 8080.
  // https://cloud.google.com/run/docs/reference/container-contract#port
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // See https://pub.dev/documentation/shelf/latest/shelf/Cascade-class.html
  final cascade = Cascade()
      // First, serve files from the 'public' directory
      .add(staticHandler)
      // If a corresponding file is not found, send requests to a `Router`
      .add(router);

  // See https://pub.dev/documentation/shelf/latest/shelf_io/serve.html
  final server = await shelf_io.serve(
    // See https://pub.dev/documentation/shelf/latest/shelf/logRequests.html
    logRequests()
        // .addMiddleware((innerHandler) => null)
        // See https://pub.dev/documentation/shelf/latest/shelf/MiddlewareExtensions/addHandler.html
        .addHandler(cascade.handler),
    InternetAddress.anyIPv4, // Allows external connections
    port,
  );

  print('Serving at http://${server.address.host}:${server.port}');
}
