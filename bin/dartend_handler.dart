import 'dart:convert';

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

    router.post('/login', (Request req) async {
      final result = await req.readAsString();
      final Map json = jsonDecode(result);
      final user = json['user'];
      final password = json['password'];

      if (user == 'admin' && password == '123456') {
        return Response.ok('Bem vindo, $user!');
      } else {
        return Response.forbidden('Not authorized');
      }
    });

    return router;
  }
}
