import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class LoginApi {
  Handler get handler {
    final router = Router();

    router.post('/login', (Request req) async {
      final result = await req.readAsString();
      final Map json = jsonDecode(result);
      final user = json['user'];
      final password = json['password'];

      if (user == 'admin' && password == '123456') {
        final response = jsonEncode({
          'token': 'token123',
          'user_id': '1',
        });
        return Response.ok(
          response,
        );
      } else {
        return Response.forbidden('Not authorized');
      }
    });

    return router;
  }
}
