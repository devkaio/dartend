import 'package:mysql1/mysql1.dart';

import '../../utils/enviroment.dart';
import 'db_config.dart';

class MySqlDBConfig implements DBConfig {
  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> get connection async {
    return _connection ??= await createConnection();
  }

  @override
  Future<MySqlConnection> createConnection() async {
    try {
      final result = await MySqlConnection.connect(
        ConnectionSettings(
          host: await Enviroment.get<String>(key: 'DB_HOST'),
          port: await Enviroment.get<int>(key: 'DB_PORT'),
          user: await Enviroment.get<String>(key: 'DB_USER'),
          password: await Enviroment.get<String>(key: 'DB_PASS'),
          db: await Enviroment.get<String>(key: 'DB_SCHEMA'),
        ),
      );
      return Future.delayed(Duration.zero, () => result);
    } catch (e) {
      throw Exception('ERROR/DB -> failed to connect');
    }
  }
}
