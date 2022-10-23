import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

class DartendServer {
  DartendServer._();

  static FutureOr<void> init({
    required Handler handler,
    required String address,
    required int port,
  }) async {
    // Inicializa o servidor
    final server = await serve(handler, address, port);

    print(
        'Servidor iniciado no endereço ${server.address} e ouvindo porta ${server.port}');
  }
}
