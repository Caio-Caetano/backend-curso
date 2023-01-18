import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request request) {
      return Response(200, body: 'Primeira Rota');
    });

    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok('Ola mundo! $usuario');
    });

    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters['idade'];
      return Response.ok('Query eh: nome: $nome, idade: $idade');
    });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);

      var usuario = json['usuario'];
      var senha = json['senha'];

      if (usuario == 'admin' && senha == '123'){
        return Response.ok('Bem vindo $usuario');
      }else{
        return Response.forbidden('Acesso negado');
      }
    });

    return router;
  }
}
