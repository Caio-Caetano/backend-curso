import 'dart:convert';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/security_service.dart';
import '../models/user_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class RegisterApi extends Api {
  final SecurityService _securityService;

  final GenericService<UserModel> _service;

  RegisterApi(this._securityService, this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();
    Random random = Random();

    router.get('/register', (Request req) {
      List<UserModel> users = _service.findAll();
      //List<String> usersMap = users.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(users));
    });

    router.post('/register', (Request req) async {
      var result = await req.readAsString();
      var body = jsonDecode(result);
      var token = await _securityService.generateJWT(body['user']);

      Map _res = {
        "id" : random.nextInt(100),
        "user": body['user'],
        "pass": body['pass'],
        "token": token
      };

      _service.save(UserModel.fromJson(_res));

      //_service.save(UserModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
