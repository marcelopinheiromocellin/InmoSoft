import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/api/api.dart';
import 'package:inmo_soft/app/components/models/response_entity.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/ventas.dart';

class VentasRepository {
  Future<Ventas> save(Ventas ventas) {
    return Api()
        .instance
        .post('/venta/save', data: ventas.toJson())
        .then((response) {
      Ventas ventas = Ventas.fromJson(response.data);
      return ventas;
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<String> findInformeVentas(String condition) {
    return Api().instance.get('/venta/reporteVenda',
        queryParameters: {'condition': condition}).then((response) {
      return response.data;
    });
  }

  Future<List<Ventas>> findAll() async {
    return Api().instance.get('/venta/findAll').then((response) {
      List<Ventas> ventas = response.data
          .map<Ventas>((c) => Ventas.fromJson(c))
          .toList() as List<Ventas>;
      return ventas;
    });
  }

  Future<String> delete(int id) async {
    return Api()
        .instance
        .delete('/venta/delete/${id.toString()}')
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

  Future<String> cancelaVenta(int id) async {
    return Api()
        .instance
        .delete('/venta/cancelaVenta/${id.toString()}')
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

  Future<void> deleteItemVenda() {
    return Api().instance.get('/venta/deleteItemVenda').then((response) {
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
      print(onError.response);
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<void> deleteVenta() {
    return Api().instance.get('/venta/deleteVenta').then((response) {
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
    });
  }
}
