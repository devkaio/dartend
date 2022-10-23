import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

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
  Future<JWT?> validateJWT(String token) async {
    final String key = await Enviroment.get<String>(key: 'JWT_KEY');

    try {
      return JWT.verify(token, SecretKey(key));
    } catch (e) {
      return null;
    }
  }

  @override
  Middleware get authorization {
    return (Handler handler) {
      return (Request req) async {
        final authorizationHeader = req.headers['Authorization'];
        JWT? jwt;
        if (authorizationHeader != null) {
          if (authorizationHeader.startsWith("Bearer ")) {
            final token = authorizationHeader.substring(7);
            jwt = await validateJWT(token);
          }
        }
        final request = req.change(
          context: {'jwt': jwt},
        );
        return handler(request);
      };
    };
  }

  @override
  Middleware get verifyJWT => createMiddleware(
        requestHandler: (Request req) {
          if (req.context['jwt'] == null) {
            return Response.forbidden('Not autorized');
          }
          return null;
        },
      );
}
