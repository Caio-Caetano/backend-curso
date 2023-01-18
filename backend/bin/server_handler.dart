import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request request) {
      return Response(200, body: 'Primeira Rota');
    });

    // Passar informacao para a rota
    // o shelf ira tratar e popular o que estiver no meio dos sinais de < >
    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok('Ola mundo! $usuario');
    });

    // /query/?nome=Caio
    // envio eh feito pelo simbolo ? 
    // e para enviar mais de uma informacao usa-se o &
    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters['idade'];
      return Response.ok('Query eh: nome: $nome, idade: $idade');
    });

    return router;
  }
}
