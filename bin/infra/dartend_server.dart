import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

class DartendServer {
  DartendServer._();

  static FutureOr<void> init({
    required Handler handler,
    required String ip,
    required int port,
  }) async {
    // Inicializa o servidor
    final server = await serve(handler, ip, port);

    print(
        'Servidor iniciado no endereço ${server.address.address} e ouvindo porta ${server.port}');
  }
}
