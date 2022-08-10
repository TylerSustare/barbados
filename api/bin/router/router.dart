// Router instance to handler requests.
import 'package:shelf_router/shelf_router.dart' as shelf_router;

import '../handlers/count/count_get.dart';
import '../handlers/count/count_options.dart';
import '../handlers/count/count_post.dart';
import '../handlers/helloworld.dart';
import '../handlers/sum.dart';
import '../handlers/time.dart';

final router = shelf_router.Router()
  ..get('/helloworld', helloWorldHandler)
  ..get(
    '/time',
    timeHandler,
  )
  ..post('/count', countPostHandler)
  ..options('/count', countOptionsHandler)
  ..get('/count', countGetHandler)
  ..get('/sum/<a|[0-9]+>/<b|[0-9]+>', sumHandler);
