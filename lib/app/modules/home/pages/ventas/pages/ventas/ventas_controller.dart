import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/models/lote.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/itens.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/ventas.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';
import 'package:mobx/mobx.dart';

part 'ventas_controller.g.dart';

class VentasController = _VentasControllerBase with _$VentasController;

abstract class _VentasControllerBase with Store {
  final VentasRepository repository;

  @observable
  Ventas ventas = Ventas.nuevo();

  @observable
  Itens listaItensSeleccionado = Itens();

  _VentasControllerBase(this.repository);

  @observable
  ObservableList<Lote> dataProvider = ObservableList();

  @observable
  bool processando = false;

  @action
  void addLote(Lote lote) {
    listaItensSeleccionado = Itens();
    listaItensSeleccionado.setLote(lote);
  }

  @action
  void addLoteLista() {
    if (listaItensSeleccionado.lote == null) {
      Alert.show("Aviso", "Seleccione un lote", Alert.WARNING);
      return;
    }
    for (var item in ventas.itens) {
      if (item.lote.id == listaItensSeleccionado.lote.id) {
        Alert.show('Aviso', 'Ya fue adicionado!', Alert.WARNING);
        return;
      }
    }
    ventas.addItem(listaItensSeleccionado);
    ventas.recalcula();
    this.listaItensSeleccionado = new Itens();
  }

  @action
  void removeItensLista() {
    this.ventas.itens = ObservableList();
    ventas.recalcula();
  }

  @action
  Future<Ventas> save() {
    processando = true;
    return repository.save(ventas).then((value) {
      ventas = Ventas.nuevo();
      listaItensSeleccionado = Itens();
      Alert.show('Aviso', 'Facturado con éxito', Alert.SUCCESS);
      return value;
    }).catchError((error) {
      Alert.show('Aviso', 'No se pudo facturar la venta', Alert.ERROR);
    }).whenComplete(() {
      processando = false;
    });
  }

  @action
  currentRecordChange(Ventas newVentas) => ventas = newVentas;
}
