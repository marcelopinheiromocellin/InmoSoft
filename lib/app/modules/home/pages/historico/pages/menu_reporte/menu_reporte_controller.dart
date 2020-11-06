import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/repository/lote_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';
import 'package:mobx/mobx.dart';

part 'menu_reporte_controller.g.dart';

class MenuReporteController = _MenuReporteControllerBase
    with _$MenuReporteController;

abstract class _MenuReporteControllerBase with Store {
  final ClienteRepository clienteRepository;
  final FuncionarioRepository funcionarioRepository;
  final LoteRepository loteRepository;
  final VentasRepository ventasRepository;

  _MenuReporteControllerBase(this.clienteRepository, this.funcionarioRepository,
      this.loteRepository, this.ventasRepository);

  Future<String> findReporteCliente(String condition) {
    return clienteRepository.findReporteCliente(condition).then((value) {
      return value;
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<String> findReporteLote(String condition) {
    return loteRepository.findReporteLote(condition).then((value) {
      return value;
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<String> findInformeVentas(String condition) {
    return ventasRepository.findInformeVentas(condition).then((value) {
      return value;
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<String> findReporteFuncionario(String condition) {
    return funcionarioRepository
        .findReporteFuncionario(condition)
        .then((value) {
      return value;
    }).catchError((onError) {
      print(onError);
    });
  }
}
