import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/controller/i_controller_base.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/models/lote.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/repository/lote_repository.dart';
import 'package:mobx/mobx.dart';

part 'lote_controller.g.dart';

class LoteController = _LoteControllerBase with _$LoteController;

abstract class _LoteControllerBase with Store implements IControllerBase {
  final LoteRepository repository;

  _LoteControllerBase(this.repository);

  @observable
  Lote lote = Lote();

  @observable
  bool processando = false;

  @action
  Future findByCondition(String nombre) {
    return repository.findByNombre(nombre).then((value) {
      return value;
    });
  }

  Future<List<Lote>> findAll(
      String nombre, String manzana, String loteamiento) {
    return repository.findAll(nombre, manzana, loteamiento);
  }

  Future<Lote> save() {
    processando = true;
    return repository.save(lote).then((value) {
      Alert.show("Lote", "Datos procesados con éxito", Alert.SUCCESS);
      lote = Lote();
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  @action
  currentRecordChange(Lote newLote) => lote = newLote;
}
