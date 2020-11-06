import 'package:inmo_soft/app/components/models/i_list_tile.dart';
import 'package:inmo_soft/app/components/utils/date/date_utils.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'funcionario.g.dart';

class Funcionario = _FuncionarioBase with _$Funcionario;

abstract class _FuncionarioBase with Store implements IListTile {
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
  String estadoCivil;
  @observable
  String telefono;
  @observable
  String direccion;
  @observable
  double salario;
  @observable
  String fechaIngreso;
  @observable
  String cargo;
  @observable
  String sexo;

  _FuncionarioBase(
      {this.id,
      this.nombre,
      this.apellido,
      this.fechaNacimiento,
      this.documento,
      this.estadoCivil,
      this.telefono,
      this.direccion,
      this.salario,
      this.fechaIngreso,
      this.cargo,
      this.sexo});

  _FuncionarioBase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    fechaNacimiento = json['fechaNacimiento'];
    documento = json['documento'];
    estadoCivil = json['estadoCivil'];
    telefono = json['telefono'];
    direccion = json['direccion'];
    salario = json['salario'];
    fechaIngreso = json['fechaIngreso'];
    cargo = json['cargo'];
    sexo = json['sexo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['fechaNacimiento'] = this.fechaNacimiento;
    data['documento'] = this.documento;
    data['estadoCivil'] = this.estadoCivil;
    data['telefono'] = this.telefono;
    data['direccion'] = this.direccion;
    data['salario'] = this.salario;
    data['fechaIngreso'] = this.fechaIngreso;
    data['cargo'] = this.cargo;
    data['sexo'] = this.sexo;
    return data;
  }

  @override
  String get title => nombre + ' ' + apellido + '\n' + 'Cargo:' + ' ' + cargo;

  @override
  String get subTitle => (telefono == null ? 'Sin teléfono' : telefono);

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

  @action
  setDtIngreso(String newDtIngreso) => fechaIngreso = newDtIngreso;

  @action
  setSalario(double newSalario) => salario = newSalario;

  @action
  setCargo(String newCargo) => cargo = newCargo;

  String get dtNascimentoFormatted {
    return DateUtils.formatDate(this.fechaNacimiento);
  }

  String get dtIngresoFormatted {
    return DateUtils.formatDate(this.fechaIngreso);
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
  String cargoError() {
    if (cargo == null || cargo.isEmpty) {
      return 'El cargo es requerido';
    }
    return null;
  }

  @action
  bool isValidCargo() {
    if (cargoError() != null) {
      return false;
    }
    return true;
  }

  @action
  String dtIngresoError() {
    if (fechaIngreso == null || fechaIngreso.isEmpty) {
      return 'El fecha Ingreso es requerido';
    }
    return null;
  }

  @action
  bool isValidDtIngreso() {
    if (dtIngresoError() != null) {
      return false;
    }
    return true;
  }

  @action
  String salarioError() {
    if (salario == null) {
      return 'El salario es requerido';
    }
    return null;
  }

  @action
  bool isValidSalario() {
    if (salarioError() != null) {
      return false;
    }
    return true;
  }

  @action
  String fechaNacimientoError() {
    if (fechaNacimiento == null) {
      return 'El fecha Nacimiento es requerido';
    }
    return null;
  }

  @action
  bool isValidFechaNacimientoError() {
    if (fechaNacimientoError() != null) {
      return false;
    }
    return true;
  }

  @action
  String fechaIngresoError() {
    if (fechaIngreso == null) {
      return 'El salario es requerido';
    }
    return null;
  }

  @action
  bool isValidFechaIngresoError() {
    if (fechaIngresoError() != null) {
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
