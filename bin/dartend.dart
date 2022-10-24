import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'api/news_api.dart';
import 'infra/dartend_server.dart';
import 'infra/database/db_config.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/interceptor_middleware.dart';
import 'infra/security/security_service.dart';
import 'utils/enviroment.dart';

void main() async {
  Enviroment.fromFile('.env');

  final di = Injects.init();

  await di.get<DBConfig>().connection;

  //Adiciona handlers em cascata
  final cascadeHandler = Cascade()
      .add(di.get<LoginApi>().getHandler()) //
      .add(di.get<NewsApi>().getHandler(middlewares: [
        di.get<SecurityService>().authorization,
        di.get<SecurityService>().verifyJWT,
      ])) //
      .handler;

  //Adiciona middlewares
  final handler = Pipeline()
      .addMiddleware(logRequests()) //
      .addMiddleware(Interceptor.middleware) //
      .addHandler(cascadeHandler);

  //Initializa servidor
  await DartendServer.init(
    ip: await Enviroment.get<String>(key: 'ADDRESS'),
    handler: handler,
    port: await Enviroment.get<int>(key: 'PORT'),
  );
}
