import 'dart:io';

import 'type_parse_extension.dart';

class Enviroment {
  Enviroment._();

  static final Map<String, String> _map = {};
  static String _file = '.env';

  factory Enviroment.fromFile(String filePath) {
    _file = filePath;
    return Enviroment._();
  }

  static Future<T> get<T>({required String key}) async {
    if (_map.isEmpty) await _load();
    return _map[key]?.toType(T);
  }

  static Future<void> _load() async {
    final lines = await _read();

    for (var element in lines) {
      _map.addAll({element.split('=')[0]: element.split('=')[1]});
    }
  }

  static Future<List<String>> _read() async {
    return await File(_file).readAsLines();
  }
}
