import 'package:shelf/shelf.dart';

import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';

void main() async {
  // Varios handlers separadamente, cascade
  // verificar se o usuario esta verificado para acessar alguma rota, pelo middleware

  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(BlogApi().handler).handler;

  // possivel de colocar handlers e middleware
  // logRequests()
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(handler);
}
