import '../../apis/blog_api.dart';
import '../../apis/login_api.dart';
import '../../models/receita_model.dart';
import '../../services/generic_service.dart';
import '../../services/receita_service.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<LoginApi>(() => LoginApi(di()));

    di.register<GenericService<ReceitaModel>>(() => ReceitaService());
    di.register<BlogApi>(() => BlogApi(di()));

    return di;
  }
}
