import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/api/api.dart';
import 'package:inmo_soft/app/components/models/response_entity.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/models/lote.dart';

class LoteRepository {
  Future<List<Lote>> findAll(
      String nombre, String manzana, String loteamiento) async {
    return Api().instance.get('/lote/findAll', queryParameters: {
      'nombre': nombre,
      'manzana': manzana,
      'loteamiento': loteamiento,
    }).then((response) {
      List<Lote> lotes = response.data
          .map<Lote>((c) => Lote.fromJson(c))
          .toList() as List<Lote>;
      return lotes;
    });
  }

  Future<String> findReporteLote(String condition) {
    return Api().instance.get('/lote/reporteLote',
        queryParameters: {'condition': condition}).then((response) {
      return response.data;
    });
  }

  Future<List<Lote>> findByNombre(String nombre) async {
    return Api().instance.get('/lote/findByNombre', queryParameters: {
      'nombre': nombre,
    }).then((response) {
      List<Lote> lotes = response.data
          .map<Lote>((c) => Lote.fromJson(c))
          .toList() as List<Lote>;
      return lotes;
    });
  }

  Future<Lote> save(Lote lote) {
    return Api()
        .instance
        .post('/lote/save', data: lote.toJson())
        .then((response) {
      Lote lote = Lote.fromJson(response.data);
      return lote;
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<String> delete(int id) async {
    return Api()
        .instance
        .delete('/lote/delete/${id.toString()}')
        .then((response) {
      print(response);
      var rep = ReponseEntity.fromJson(response.data);
      if (rep.errorCode == 500) {
        print(rep.message);
        Alert.show("Atención", rep.message, Alert.WARNING);
      }
      if (rep.errorCode == 200) {
        print(rep.message);
        Alert.show("Exito", rep.message, Alert.SUCCESS);
      }
      return response.data;
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<void> deleteLote() {
    return Api().instance.get('/lote/deleteLote').then((response) {
      print(response);
      var rep = ReponseEntity.fromJson(response.data);
      if (rep.errorCode == 500) {
        print(rep.message);
        Alert.show("Atención", rep.message, Alert.WARNING);
      }
      if (rep.errorCode == 200) {
        print(rep.message);
        Alert.show("Exito", rep.message, Alert.SUCCESS);
      }
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }
}
