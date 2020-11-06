import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/api/api.dart';
import 'package:inmo_soft/app/components/models/response_entity.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/models/cliente.dart';

class ClienteRepository {
  Future<List<Cliente>> findByNombreAndApellido(
      String nombre, String apellido) async {
    return Api().instance.get('/cliente/findByNombreAndApellido',
        queryParameters: {
          'nombre': nombre,
          'apellido': apellido
        }).then((response) {
      List<Cliente> clientes = response.data
          .map<Cliente>((c) => Cliente.fromJson(c))
          .toList() as List<Cliente>;
      return clientes;
    });
  }

  Future<String> findReporteCliente(String condition) {
    return Api().instance.get('/cliente/reporte',
        queryParameters: {'condition': condition}).then((response) {
      return response.data;
    });
  }

  Future<Cliente> findByDocumento(String documento) {
    return Api().instance.get('/cliente/findByDocumento',
        queryParameters: {'documento': documento}).then((response) {
      return Cliente.fromJson(response.data);
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<Cliente> save(Cliente cliente) {
    return Api()
        .instance
        .post('/cliente/save', data: cliente.toJson())
        .then((response) {
      Cliente cliente = Cliente.fromJson(response.data);
      return cliente;
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<String> delete(int id) async {
    return Api()
        .instance
        .delete('/cliente/delete/${id.toString()}')
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

  Future<void> deleteCliente() {
    return Api().instance.get('/cliente/deleteCliente').then((response) {
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
}
