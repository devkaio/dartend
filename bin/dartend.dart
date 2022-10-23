import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'api/news_api.dart';
import 'infra/dartend_server.dart';
import 'services/news_service.dart';
import 'utils/enviroment.dart';

void main() async {
  Enviroment.fromFile('.env');
  //Adiciona handlers em cascata
  final cascadeHandler = Cascade()
      .add(LoginApi().handler) //
      .add(NewsApi(NewsService()).handler) //
      .handler;

  //Adiciona middlewares
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  //Initializa servidor
  await DartendServer.init(
    address: await Enviroment.get<String>(key: 'ADDRESS'),
    handler: handler,
    port: await Enviroment.get<int>(key: 'PORT'),
  );
}
