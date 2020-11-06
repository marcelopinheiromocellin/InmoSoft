import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/api/api.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/models/configuracion.dart';

class ConfiguracionRepository {
  Future<Configuracion> save(Configuracion configuracion) {
    return Api()
        .instance
        .post('/configuracion/save', data: configuracion.toJson())
        .then((response) {
      Configuracion configuracion = Configuracion.fromJson(response.data);
      return configuracion;
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }

  Future<Configuracion> findById(int id) {
    return Api().instance.get('/configuracion/findById').then((response) {
      return Configuracion.fromJson(response.data);
    }).catchError((onError) {
      Alert.show("Error", onError.response.data, Alert.ERROR);
    });
  }
}
