import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'api/news_api.dart';
import 'infra/dartend_server.dart';

void main() async {
  //Adiciona handlers em cascata
  final cascadeHandler = Cascade()
      .add(LoginApi().handler) //
      .add(NewsApi().handler) //
      .handler;

  //Adiciona middlewares
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  //Initializa servidor
  await DartendServer.init(handler);
}
