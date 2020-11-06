import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/controller/i_controller_base.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/models/cliente.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'package:mobx/mobx.dart';

part 'cliente_controller.g.dart';

class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store implements IControllerBase {
  final ClienteRepository repository;

  _ClienteControllerBase(this.repository);

  @observable
  Cliente cliente = Cliente();

  @action
  Future findByCondition(String nombre) {
    return repository.findByNombreAndApellido(nombre, nombre);
  }

//buscador
  @observable
  ObservableList<Cliente> dataProvider = ObservableList();

  @observable
  bool processando = false;

  @action
  Future<List<Cliente>> findByNombreAndApellido(
      String nombre, String apellido) {
    return repository.findByNombreAndApellido(nombre, apellido);
  }

  @action
  Future<Cliente> findByDocumento() {
    processando = true;
    return repository.findByDocumento(cliente.documento).then((value) {
      if (value.documento == cliente.documento && value.documento != null) {
        Alert.show('Aviso', 'Cliente ya existe, podes editar', Alert.WARNING);
        return currentRecordChange(value);
      }
      if (value.documento != cliente.documento) {
        return Alert.show(
            'Aviso', 'Podes seguir creando el cliente', Alert.SUCCESS);
      }
      if (value.documento == null) {
        return Alert.show('Aviso',
            'falta poner el documento y dar ok en teclado', Alert.SUCCESS);
      }
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  Future<Cliente> save() {
    processando = true;
    return repository.save(cliente).then((value) {
      Alert.show("Cliente", "Datos procesados con éxito", Alert.SUCCESS);
      cliente = Cliente();
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  @action
  currentRecordChange(Cliente newCliente) => cliente = newCliente;
}
