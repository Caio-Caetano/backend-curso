import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BlogApi {
  Handler get handler {
    Router router = Router();

    //listagem
    router.get('/blog/receitas', (Request req) {
      return Response.ok('bolo de cenoura');
    });

    //nova receita
    router.post('/blog/receitas', (Request req) {
      return Response.ok('bolo de cenoura');
    });

    //atualizar receita  /blog/receitas?id=1
    router.put('/blog/receitas', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('bolo de cenoura');
    });

    //deletar receita
    router.delete('/blog/receitas', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('bolo de cenoura');
    });

    return router;
  }
}
