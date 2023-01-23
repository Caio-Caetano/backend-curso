import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:test/expect.dart';

import '../infra/security/security_service.dart';
import '../models/user_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class LoginApi extends Api {
  final SecurityService _securityService;
  final GenericService<UserModel> _service;
  LoginApi(this._securityService, this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();
    router.post('/login', (Request req) async {
      var body = await req.readAsString();
      var user = jsonDecode(body)["user"];
      var pass = jsonDecode(body)["pass"];
      var bodyDecoded = jsonDecode(body);

      List<UserModel> listRegister = _service.findAll();
      List<Map> listRegisterMap = listRegister.map((e) => e.toJson()).toList();

      if (body.isNotEmpty) {
        // user == user registrado && pass == pass registrada
        var userEncontrado = listRegisterMap
            .firstWhere((e) => e['user'] == jsonDecode(body)['user'], orElse: () => {});
        if (user == userEncontrado["user"] && pass == userEncontrado["pass"]) {
          // apos verificar os dados passados, verifica o token
          var verificated =
              await _securityService.validateJWT(userEncontrado["token"]);
          if (verificated != null) {
            return Response.ok(jsonEncode(listRegisterMap));
          }
        }
      }
      return Response.forbidden("Not Authorized");
    });
    return createHandler(router: router, middlewares: middlewares);
  }
}
