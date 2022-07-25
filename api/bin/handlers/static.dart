import 'package:shelf_static/shelf_static.dart' as shelf_static;

// Serve files from the file system.
final staticHandler = shelf_static.createStaticHandler(
  'public',
  defaultDocument: 'index.html',
);
