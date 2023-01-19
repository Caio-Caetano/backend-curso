import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/receita_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class BlogApi extends Api {
  final GenericService<ReceitaModel> _service;
  BlogApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();

    //listagem
    router.get('/blog/receitas', (Request req) {
      List<ReceitaModel> receitas = _service.findAll();
      List<Map> receitasMap = receitas.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(receitasMap));
    });

    //nova receita
    router.post('/blog/receitas', (Request req) async {
      var body = await req.readAsString();
      _service.save(ReceitaModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    //atualizar receita  /blog/receitas?id=1
    router.put('/blog/receitas', (Request req) {
      String? id = req.url.queryParameters['id'];
      //_service.save('');
      return Response.ok('bolo de cenoura');
    });

    //deletar receita
    router.delete('/blog/receitas', (Request req) {
      String? id = req.url.queryParameters['id'];
      //_service.delete(1);
      return Response.ok('bolo de cenoura');
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
