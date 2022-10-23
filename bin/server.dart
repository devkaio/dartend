import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'dartend_handler.dart';

void main(List<String> args) async {
  // Configura IP do servidor
  final ip = InternetAddress.anyIPv4;

  // Adiciona log de request
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(DartendHandler.handler);

  // Configura porta
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler, ip, port);
  print('Servidor iniciado e ouvindo porta ${server.port}');
}
