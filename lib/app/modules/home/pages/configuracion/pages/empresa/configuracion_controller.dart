import 'package:get/get.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/models/configuracion.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/repository/configuracion_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/repository/lote_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';
import 'package:mobx/mobx.dart';

part 'configuracion_controller.g.dart';

class ConfiguracionController = _ConfiguracionControllerBase
    with _$ConfiguracionController;

abstract class _ConfiguracionControllerBase with Store {
  final ClienteRepository clienteRepository;
  final FuncionarioRepository funcionarioRepository;
  final LoteRepository loteRepository;
  final ConfiguracionRepository repository;
  final VentasRepository ventaRepository;

  _ConfiguracionControllerBase(this.repository, this.clienteRepository,
      this.funcionarioRepository, this.loteRepository, this.ventaRepository);

  @observable
  Configuracion currentRecord = Configuracion();

  @observable
  bool processando = false;

  @observable
  Configuracion configuracion = Configuracion();

  Future<Configuracion> save() {
    processando = true;

    return repository.save(currentRecord).then((value) {
      Get.back();
      Alert.show("Lote", "Datos procesados con éxito", Alert.SUCCESS);
      return value;
    }).catchError((error) {
      Alert.show(
          "Avisó", " Los datos no fueron procesados con éxito", Alert.SUCCESS);
      print(error);
    }).whenComplete(() => processando = false);
  }

  @action
  Future<Configuracion> findById() {
    return repository.findById(configuracion.id).then((value) {
      currentRecordChange(value);
      return value;
    });
  }

  @action
  currentRecordChange(Configuracion newConfiguracion) =>
      currentRecord = newConfiguracion;

  void deleteCliente() {
    processando = true;
    clienteRepository.deleteCliente().then((value) {
      print('SUCESS');
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  void deleteFuncionario() {
    processando = true;
    funcionarioRepository
        .deleteFuncionario()
        .then((value) {})
        .catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  void deleteLote() {
    processando = true;
    loteRepository.deleteLote().then((value) {}).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  void deleteItemVenda() {
    processando = true;
    ventaRepository.deleteItemVenda().then((value) {}).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  void deleteVenta() {
    processando = true;
    ventaRepository
        .deleteVenta()
        .then((value) {})
        .catchError((error) {})
        .whenComplete(() => processando = false);
  }
}
