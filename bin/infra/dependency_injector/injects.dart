import '../../api/login_api.dart';
import '../../api/news_api.dart';
import '../../models/news_model.dart';
import '../../services/generic_service.dart';
import '../../services/news_service.dart';
import '../database/db_config.dart';
import '../database/mysql_config.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector init() {
    final di = DependencyInjector();

    di.register<DBConfig>(() => MySqlDBConfig());

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<LoginApi>(() => LoginApi(di()));

    di.register<GenericService<NewsModel>>(() => NewsService());

    di.register<NewsApi>(() => NewsApi(di()));

    return di;
  }
}
