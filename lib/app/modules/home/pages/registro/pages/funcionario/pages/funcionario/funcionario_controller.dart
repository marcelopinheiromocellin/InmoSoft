import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/controller/i_controller_base.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/models/funcionario.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';
import 'package:mobx/mobx.dart';

part 'funcionario_controller.g.dart';

class FuncionarioController = _FuncionarioControllerBase
    with _$FuncionarioController;

abstract class _FuncionarioControllerBase
    with Store
    implements IControllerBase {
  final FuncionarioRepository repository;

  _FuncionarioControllerBase(this.repository);

  @observable
  Funcionario currentRecord = Funcionario();

  @observable
  bool processando = false;

  @action
  Future findByCondition(String nombre) {
    return repository.findByNombre(nombre, nombre);
  }

  Future<List<Funcionario>> findByNombre(String nombre, String apellido) {
    return repository.findByNombre(nombre, apellido);
  }

  Future<Funcionario> save() {
    processando = true;
    return repository.save(currentRecord).then((value) {
      Alert.show("Funcionario", "Datos procesados con éxito", Alert.SUCCESS);
      currentRecord = Funcionario();
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  @action
  Future<Funcionario> findByDocumento() {
    processando = true;
    return repository.findByDocumento(currentRecord.documento).then((value) {
      if (value.documento == currentRecord.documento &&
          value.documento != null) {
        Alert.show(
            'Aviso', 'Funcionario ya existe, podes editar', Alert.WARNING);
        currentRecordChange(value);
      }
      if (value.documento != currentRecord.documento) {
        return Alert.show(
            'Aviso', 'Podes seguir creando el funcionario', Alert.SUCCESS);
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

  @action
  currentRecordChange(Funcionario newFuncionario) =>
      currentRecord = newFuncionario;
}
