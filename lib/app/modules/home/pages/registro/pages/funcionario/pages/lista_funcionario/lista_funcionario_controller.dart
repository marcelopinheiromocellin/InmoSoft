import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/models/funcionario.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';
import 'package:mobx/mobx.dart';

part 'lista_funcionario_controller.g.dart';

class ListaFuncionarioController = _ListaFuncionarioControllerBase
    with _$ListaFuncionarioController;

abstract class _ListaFuncionarioControllerBase with Store {
  final FuncionarioRepository repository;

  _ListaFuncionarioControllerBase(this.repository);

  @observable
  ObservableList<Funcionario> dataProvider = ObservableList();

  @observable
  bool processando = false;
  @observable
  Funcionario funcionario = Funcionario();

  @observable
  Future<List<Funcionario>> findByNombre(String nombre, String apellido) async {
    return repository.findByNombre(nombre, apellido).then((value) {
      dataProvider = value.asObservable();
      return value;
    });
  }

  Future<String> delete(int id) {
    processando = true;
    return repository.delete(id).then((value) {
      funcionario = Funcionario();
      Alert.show("Exito", "Eliminado con éxito", Alert.SUCCESS);
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }
}
