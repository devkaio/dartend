import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../../utils/enviroment.dart';
import 'security_service.dart';

class SecurityServiceImp implements SecurityService<JWT> {
  @override
  Future<String> generateJWT(String userId) async {
    final jwt = JWT({
      'iat': DateTime.now().millisecondsSinceEpoch,
      'userId': userId,
      'roles': ['admin', 'user']
    });
    final key = await Enviroment.get<String>(key: 'JWT_KEY');

    final String token = jwt.sign(SecretKey(key));

    return token;
  }

  @override
  JWT? validateJWT(String token) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }
}
