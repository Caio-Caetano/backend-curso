import '../models/receita_model.dart';
import 'generic_service.dart';
import '../utils/list_extension.dart';

class ReceitaService implements GenericService<ReceitaModel> {
  final List<ReceitaModel> _fakeDB = [];

  @override
  bool delete(int id) {
    _fakeDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<ReceitaModel> findAll() {
    return _fakeDB;
  }

  @override
  ReceitaModel findOne(int id) {
    return _fakeDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(ReceitaModel value) {
    ReceitaModel? model = _fakeDB.firstWhereOrNull((e) => e.id == value.id);
    if (model == null) {
      _fakeDB.add(value);
    } else {
      var index = _fakeDB.indexOf(model);
      _fakeDB[index] = value;
    }

    return true;
  }
}