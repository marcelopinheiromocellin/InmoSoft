import 'package:inmo_soft/app/components/models/i_list_tile.dart';
import 'package:mobx/mobx.dart';

part 'lote.g.dart';

class Lote = _LoteBase with _$Lote;

abstract class _LoteBase with Store implements IListTile {
  int id;
  @observable
  String nombre;
  @observable
  String direccion;
  @observable
  double precio;
  @observable
  String estado;
  @observable
  String dimension;
  @observable
  String ctacteCatastral;
  @observable
  String manzana;
  @observable
  String barrio;
  @observable
  String loteamiento;

  _LoteBase(
      {this.id,
      this.nombre,
      this.direccion,
      this.precio,
      this.estado,
      this.dimension,
      this.ctacteCatastral,
      this.manzana,
      this.barrio,
      this.loteamiento});

  _LoteBase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    direccion = json['direccion'];
    precio = json['precio'];
    estado = json['estado'];
    dimension = json['dimension'];
    ctacteCatastral = json['ctacteCatastral'];
    manzana = json['manzana'];
    barrio = json['barrio'];
    loteamiento = json['loteamiento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['direccion'] = this.direccion;
    data['precio'] = this.precio;
    data['estado'] = this.estado;
    data['dimension'] = this.dimension;
    data['ctacteCatastral'] = this.ctacteCatastral;
    data['manzana'] = this.manzana;
    data['barrio'] = this.barrio;
    data['loteamiento'] = this.loteamiento;
    return data;
  }

  @override
  String get title => nombre;

  @override
  String get subTitle => (precio == null ? 0.0 : precio.toString() + ' \Gs.');

  @action
  setNombre(String newNombre) => nombre = newNombre;

  @action
  setDireccion(String newDireccion) => direccion = newDireccion;

  @action
  setPrecio(double newPrecio) => precio = newPrecio;

  @action
  setEstado(String newEstado) => estado = newEstado;

  @action
  setDimencion(String newDimencion) => dimension = newDimencion;

  @action
  setCtacteCatastral(String newCtacteCatastral) =>
      ctacteCatastral = newCtacteCatastral;

  @action
  setManzana(String newManzana) => manzana = newManzana;

  @action
  setBarrio(String newBarrio) => barrio = newBarrio;

  @action
  setLoteamiento(String newLoteamiento) => loteamiento = newLoteamiento;

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
  String direccionError() {
    if (direccion == null || direccion.isEmpty) {
      return 'El dirección es requerido';
    }
    return null;
  }

  @action
  bool isValidDireccion() {
    if (direccionError() != null) {
      return false;
    }
    return true;
  }

  @action
  String precioError() {
    if (precio == null) {
      return 'El precio es requerido';
    }
    return null;
  }

  @action
  bool isValidPrecio() {
    if (precioError() != null) {
      return false;
    }
    return true;
  }

  @action
  String estadoError() {
    if (estado == null) {
      return 'El estado es requerido';
    }
    return null;
  }

  @action
  bool isValidEstado() {
    if (estadoError() != null) {
      return false;
    }
    return true;
  }

  @action
  String dimensionError() {
    if (dimension == null) {
      return 'El dimensión es requerido';
    }
    return null;
  }

  @action
  bool isValidDimencion() {
    if (dimensionError() != null) {
      return false;
    }
    return true;
  }

  @action
  String ctacteCatastralError() {
    if (ctacteCatastral == null) {
      return 'La Cuenta Corriente Catastral es requerido';
    }
    return null;
  }

  @action
  bool isValidCtacteCatastral() {
    if (ctacteCatastralError() != null) {
      return false;
    }
    return true;
  }

  @action
  String manzanaError() {
    if (manzana == null) {
      return 'El manzana es requerido';
    }
    return null;
  }

  @action
  bool isValidManzana() {
    if (manzanaError() != null) {
      return false;
    }
    return true;
  }

  @action
  String barrioError() {
    if (barrio == null) {
      return 'El barrio es requerido';
    }
    return null;
  }

  @action
  bool isValidBarrio() {
    if (barrioError() != null) {
      return false;
    }
    return true;
  }

  @action
  String loteamientoError() {
    if (loteamiento == null) {
      return 'El loteamiento es requerido';
    }
    return null;
  }

  @action
  bool isValidLoteamiento() {
    if (loteamientoError() != null) {
      return false;
    }
    return true;
  }
}
