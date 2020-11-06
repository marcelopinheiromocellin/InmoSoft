import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/models/configuracion.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/repository/configuracion_repository.dart';
import 'package:mobx/mobx.dart';

part 'sub_menu_controller.g.dart';

class SubMenuController = _SubMenuControllerBase with _$SubMenuController;

abstract class _SubMenuControllerBase with Store {
  final ConfiguracionRepository repository;

  _SubMenuControllerBase(this.repository);

  @observable
  Configuracion currentRecord = Configuracion();

  @observable
  bool processando = false;

  Future<Configuracion> save() {
    processando = true;
    return repository.save(currentRecord).then((value) {
      Alert.show("Configuración", "Datos procesados con éxito", Alert.SUCCESS);
      currentRecord = Configuracion();
      return value;
    }).catchError((error) {
      print(error);
    }).whenComplete(() => processando = false);
  }

  @action
  currentRecordChange(Configuracion newConfiguracion) =>
      currentRecord = newConfiguracion;
}
