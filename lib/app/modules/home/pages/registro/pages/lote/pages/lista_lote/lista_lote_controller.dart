import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/models/lote.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/repository/lote_repository.dart';
import 'package:mobx/mobx.dart';

part 'lista_lote_controller.g.dart';

class ListaLoteController = _ListaLoteControllerBase with _$ListaLoteController;

abstract class _ListaLoteControllerBase with Store {
  final LoteRepository repository;

  _ListaLoteControllerBase(this.repository);

  @observable
  ObservableList<Lote> dataProvider = ObservableList();

  @observable
  bool processando = false;
  @observable
  Lote lote = Lote();

  @observable
  Future<List<Lote>> findAll(
      String nombre, String manzana, String loteamiento) async {
    return repository.findAll(nombre, manzana, loteamiento).then((value) {
      dataProvider = value.asObservable();
      return value;
    });
  }

  Future<String> delete(int id) {
    processando = true;
    return repository.delete(id).then((value) {
      lote = Lote();
      Alert.show("Exito", "Eliminado con éxito", Alert.SUCCESS);
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }
}
