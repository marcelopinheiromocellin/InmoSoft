import 'package:inmo_soft/app/components/models/i_list_tile.dart';
import 'package:inmo_soft/app/components/utils/date/date_utils.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'cliente.g.dart';

class Cliente = _ClienteBase with _$Cliente;

abstract class _ClienteBase with Store implements IListTile {
  int id;
  @observable
  String nombre;
  @observable
  String apellido;
  @observable
  String fechaNacimiento;
  @observable
  String documento;
  @observable
  String sexo;
  @observable
  String estadoCivil;
  @observable
  String telefono;
  @observable
  String direccion;

  _ClienteBase(
      {this.id,
      this.nombre,
      this.apellido,
      this.fechaNacimiento,
      this.documento,
      this.sexo,
      this.estadoCivil,
      this.telefono,
      this.direccion});

  _ClienteBase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    fechaNacimiento = json['fechaNacimiento'];
    documento = json['documento'];
    sexo = json['sexo'];
    estadoCivil = json['estadoCivil'];
    telefono = json['telefono'];
    direccion = json['direccion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['fechaNacimiento'] = this.fechaNacimiento;
    data['documento'] = this.documento;
    data['sexo'] = this.sexo;
    data['estadoCivil'] = this.estadoCivil;
    data['telefono'] = this.telefono;
    data['direccion'] = this.direccion;
    return data;
  }

  @override
  String get subTitle => (telefono == null ? 'Sin Telefono' : telefono);

  @override
  String get title => nombre + ' ' + apellido;

  @action
  setNombre(String newNombre) => nombre = newNombre;

  @action
  setTelefono(String newTelefono) => telefono = newTelefono;

  @action
  setApellido(String newApellido) => apellido = newApellido;

  @action
  setDocumento(String newDocumento) => documento = newDocumento;

  @action
  setEstadoCivil(String newEstadoCivil) => estadoCivil = newEstadoCivil;

  @action
  setSexo(String newSexo) => sexo = newSexo;

  @action
  setDireccion(String newDireccion) => direccion = newDireccion;

  @action
  setDtNascimento(String newDtNascimento) => fechaNacimiento = newDtNascimento;

  String get dtNascimentoFormatted {
    return DateUtils.formatDate(this.fechaNacimiento);
  }

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
  String apellidoError() {
    if (apellido == null || apellido.isEmpty) {
      return 'El apellido es requerido';
    }
    return null;
  }

  @action
  bool isValidApellido() {
    if (apellidoError() != null) {
      return false;
    }
    return true;
  }

  @action
  String documentoError() {
    if (documento == null || documento.isEmpty) {
      return 'El documento es requerido';
    }
    return null;
  }

  @action
  bool isValidDocumento() {
    if (documentoError() != null) {
      return false;
    }
    return true;
  }

  @action
  String telefonoError() {
    if (telefono == null || telefono.isEmpty) {
      return 'El telefono es requerido';
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
  String estadoCivilError() {
    if (estadoCivil == null || estadoCivil.isEmpty) {
      return 'El estado civil es requerido';
    }
    return null;
  }

  @action
  bool isValidEstadoCivil() {
    if (estadoCivilError() != null) {
      return false;
    }
    return true;
  }

  @action
  String sexoError() {
    if (sexo == null || sexo.isEmpty) {
      return 'El sexo es requerido';
    }
    return null;
  }

  @action
  bool isValidSexo() {
    if (sexoError() != null) {
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
  String fechaNacimientoError() {
    if (fechaNacimiento == null) {
      return 'El fecha nacimiento es requerido';
    }

    return null;
  }

  @action
  bool isValidFechaNacimiento() {
    if (fechaNacimientoError() != null) {
      return false;
    }
    return true;
  }

  @action
  bool isValidAdult() {
    String datePattern = "yyyy";
    DateTime dataConvert = DateFormat(datePattern).parse(fechaNacimiento);

    DateTime birthDate = dataConvert;
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;

    if (yearDiff > 18 || yearDiff == 18) {
      return false;
    }

    return true;
  }
}
