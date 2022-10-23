import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';

class NewsApi {
  final GenericService _service;

  NewsApi(this._service);

  Handler get handler {
    final router = Router();

    router.get('/news', (Request req) {
      //TODO: _service.findAll();
      return Response.ok('hello world');
    });

    router.post('/news', (Request req) {
      //TODO: _service.save('');
      return Response.ok('hello world');
    });

    router.put('/news', (Request req) {
      //TODO: _service.save('');

      final String? id = req.url.queryParameters['id'];
      return Response.ok('hello world');
    });

    router.delete('/news', (Request req) {
      //TODO: _service.delete(value);
      final String? id = req.url.queryParameters['id'];
      return Response.ok('hello world');
    });

    return router;
  }
}
