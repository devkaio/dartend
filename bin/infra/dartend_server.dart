import 'dart:async';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

class DartendServer {
  DartendServer._();

  static FutureOr<void> init(Handler handler) async {
    final ip = InternetAddress.anyIPv4;
    final port = int.parse(Platform.environment['PORT'] ?? '8080');

    // Inicializa o servidor
    final server = await serve(handler, ip, port);

    print('Servidor iniciado e ouvindo porta ${server.port}');
  }
}
