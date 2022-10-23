import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

///Classe responsável por definir rotas do servidor
class DartendHandler {
  DartendHandler._();

  ///Retorna respostas a partir de requisições
  static Handler get handler {
    final router = Router();

    // Configura rotas do servidor.
    router.get('/', (Request req) {
      return Response.ok("Ola, mundo!\n");
    });

    router.post('/login', (Request req) {
      return Response.ok("Autorizado");
    });

    return router;
  }
}
