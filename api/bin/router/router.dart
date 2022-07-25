// Router instance to handler requests.
import 'package:shelf_router/shelf_router.dart' as shelf_router;

import '../handlers/helloworld.dart';
import '../handlers/sum.dart';
import '../handlers/time.dart';

final router = shelf_router.Router()
  ..get('/helloworld', helloWorldHandler)
  ..get(
    '/time',
    timeHandler,
  )
  ..get('/sum/<a|[0-9]+>/<b|[0-9]+>', sumHandler);
