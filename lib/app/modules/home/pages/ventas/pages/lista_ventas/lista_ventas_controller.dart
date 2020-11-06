import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/ventas.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';
import 'package:mobx/mobx.dart';
part 'lista_ventas_controller.g.dart';

class ListaVentaController = _ListaVentaControllerBase
    with _$ListaVentaController;

abstract class _ListaVentaControllerBase with Store {
  final VentasRepository repository;

  _ListaVentaControllerBase(this.repository);

  @observable
  ObservableList<Ventas> dataProvider = ObservableList();

  @observable
  bool processando = false;

  @observable
  Ventas ventas = Ventas();

  @observable
  Future<List<Ventas>> findAll() async {
    return repository.findAll().then((value) {
      dataProvider = value.asObservable();
      return value;
    });
  }

  Future<String> delete(int id) {
    processando = true;
    return repository.delete(id).then((value) {
      ventas = Ventas();
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  Future<String> cancelaVenta(int id) {
    processando = true;
    return repository.cancelaVenta(id).then((value) {
      ventas = Ventas();
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }
}
