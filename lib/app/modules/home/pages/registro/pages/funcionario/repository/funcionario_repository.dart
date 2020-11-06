import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/api/api.dart';
import 'package:inmo_soft/app/components/models/response_entity.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/models/funcionario.dart';

class FuncionarioRepository {
  Future<List<Funcionario>> findByNombre(String nombre, String apellido) async {
    return Api().instance.get('/funcionario/findByNombre', queryParameters: {
      'nombre': nombre,
      'apellido': apellido,
    }).then((response) {
      List<Funcionario> funcionarios = response.data
          .map<Funcionario>((c) => Funcionario.fromJson(c))
          .toList() as List<Funcionario>;
      return funcionarios;
    });
  }

  Future<Funcionario> save(Funcionario funcionario) {
    return Api()
        .instance
        .post('/funcionario/save', data: funcionario.toJson())
        .then((response) {
      Funcionario funcionario = Funcionario.fromJson(response.data);
      return funcionario;
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<String> delete(int id) async {
    return Api()
        .instance
        .delete('/funcionario/delete/${id.toString()}')
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

  Future<Funcionario> findByDocumento(String documento) {
    return Api().instance.get('/funcionario/findByDocumento',
        queryParameters: {'documento': documento}).then((response) {
      return Funcionario.fromJson(response.data);
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<void> deleteFuncionario() {
    return Api()
        .instance
        .get('/funcionario/deleteFuncionario')
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
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<String> findReporteFuncionario(String condition) {
    return Api().instance.get('/funcionario/reporteFuncionario',
        queryParameters: {'condition': condition}).then((response) {
      return response.data;
    });
  }
}
