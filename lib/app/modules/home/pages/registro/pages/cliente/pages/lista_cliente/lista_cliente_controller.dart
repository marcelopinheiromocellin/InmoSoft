import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/models/cliente.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'package:mobx/mobx.dart';

part 'lista_cliente_controller.g.dart';

class ListaClienteController = _ListaClienteControllerBase
    with _$ListaClienteController;

abstract class _ListaClienteControllerBase with Store {
  final ClienteRepository repository;

  _ListaClienteControllerBase(this.repository);

  @observable
  ObservableList<Cliente> dataProvider = ObservableList();

  @observable
  bool processando = false;
  @observable
  Cliente cliente = Cliente();

  @observable
  Future<List<Cliente>> findByNombreAndApellido(
      String nombre, String apellido) async {
    return repository.findByNombreAndApellido(nombre, apellido).then((value) {
      dataProvider = value.asObservable();
      return value;
    });
  }

  Future<String> delete(int id) {
    processando = true;
    return repository.delete(id).then((value) {
      cliente = Cliente();
      Alert.show("Exito", "Eliminado con éxito", Alert.SUCCESS);
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }
}
