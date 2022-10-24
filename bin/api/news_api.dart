import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/news_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class NewsApi extends Api {
  final GenericService<NewsModel> _service;

  NewsApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares}) {
    final router = Router();

    router.get('/news', (Request req) {
      final List<NewsModel> news = _service.findAll();
      final mapNews = news.map((e) => e.toMap()).toList();

      return Response.ok(
        jsonEncode(mapNews),
      );
    });

    router.post('/news', (Request req) async {
      final body = await req.readAsString();
      _service.save(NewsModel.fromMap(jsonDecode(body)));

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

    return createHandler(
      router: router,
      middlewares: middlewares,
    );
  }
}
