import 'package:mobx/mobx.dart';

part 'configuracion.g.dart';

class Configuracion = _ConfiguracionBase with _$Configuracion;

abstract class _ConfiguracionBase with Store {
  int id;
  @observable
  String nombre;
  @observable
  String telefono;
  @observable
  String ruc;

  _ConfiguracionBase({
    this.id,
    this.nombre,
    this.telefono,
    this.ruc,
  });

  _ConfiguracionBase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    telefono = json['telefono'];
    ruc = json['ruc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['telefono'] = this.telefono;
    data['ruc'] = this.ruc;
    return data;
  }

  @override
  String get subTitle => (telefono == null ? 'Sin Telefono' : telefono);

  @override
  String get title => nombre;

  @action
  setNombre(String newNombre) => nombre = newNombre;

  @action
  setTelefono(String newTelefono) => telefono = newTelefono;

  @action
  setRuc(String newRuc) => ruc = newRuc;

  @action
  String nombreError() {
    if (nombre == null || nombre.isEmpty) {
      return 'El nombre es requerido';
    }
    return null;
  }

  @action
  bool isValidNombre() {
    if (nombreError() != null) {
      return false;
    }

    return true;
  }

  @action
  String telefonoError() {
    if (telefono == null || telefono.isEmpty) {
      return 'El teléfono es requerido';
    }
    return null;
  }

  @action
  bool isValidTelefono() {
    if (telefonoError() != null) {
      return false;
    }

    return true;
  }

  @action
  String rucError() {
    if (ruc == null || ruc.isEmpty) {
      return 'El ruc es requerido';
    }
    return null;
  }

  @action
  bool isValidRuc() {
    if (rucError() != null) {
      return false;
    }

    return true;
  }
}
