import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class NewsApi {
  Handler get handler {
    final router = Router();

    router.get('/news', (Request req) {
      return Response.ok('hello world');
    });

    router.post('/news', (Request req) {
      return Response.ok('hello world');
    });

    router.put('/news', (Request req) {
      final String? id = req.url.queryParameters['id'];
      return Response.ok('hello world');
    });

    router.delete('/news', (Request req) {
      final String? id = req.url.queryParameters['id'];
      return Response.ok('hello world');
    });

    return router;
  }
}
