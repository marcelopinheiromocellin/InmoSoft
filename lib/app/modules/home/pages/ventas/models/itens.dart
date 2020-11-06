import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/models/lote.dart';
import 'package:mobx/mobx.dart';

part 'itens.g.dart';

class Itens = _ItensBase with _$Itens;

abstract class _ItensBase with Store {
  int id;
  @observable
  Lote lote;

  _ItensBase({this.lote});

  _ItensBase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lote = json['lote'] != null ? new Lote.fromJson(json['lote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lote != null) {
      data['lote'] = this.lote.toJson();
      data['id'] = this.id;
    }
    return data;
  }

  @action
  setLote(Lote newLote) => lote = newLote;
}
