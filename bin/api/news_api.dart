import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class NewsApi {
  Handler get handler {
    final router = Router();

    router.post('/news', (Request req) {
      return Response.ok('hello world');
    });

    return router;
  }
}
