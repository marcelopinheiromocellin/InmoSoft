import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/models/cliente.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/models/funcionario.dart';
import 'package:mobx/mobx.dart';

import 'itens.dart';

part 'ventas.g.dart';

class Ventas = _VentasBase with _$Ventas;

abstract class _VentasBase with Store {
  int id;
  @observable
  String fechaEmision;
  @observable
  String condicion;
  @observable
  String estado;
  @observable
  double totalVenta;
  @observable
  String obervacion;
  @observable
  Cliente cliente;
  @observable
  Funcionario funcionario;

  @observable
  ObservableList<Itens> itens = ObservableList();

  _VentasBase(
      {this.id,
      this.fechaEmision,
      this.condicion,
      this.estado,
      this.totalVenta,
      this.obervacion,
      this.cliente,
      this.funcionario,
      this.itens});

  _VentasBase.nuevo() {
    this.itens = ObservableList();
  }

  _VentasBase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fechaEmision = json['fechaEmision'];
    condicion = json['condicion'];
    estado = json['estado'];
    totalVenta = json['totalVenta'];
    obervacion = json['obervacion'];
    cliente =
        json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
    funcionario = json['funcionario'] != null
        ? new Funcionario.fromJson(json['funcionario'])
        : null;
    if (json['itens'] != null) {
      itens = new ObservableList<Itens>();
      json['itens'].forEach((v) {
        itens.add(new Itens.fromJson(v));
      });
    } else {
      itens = ObservableList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fechaEmision'] = this.fechaEmision;
    data['condicion'] = this.condicion;
    data['estado'] = this.estado;
    data['totalVenta'] = this.totalVenta;
    data['obervacion'] = this.obervacion;
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    if (this.funcionario != null) {
      data['funcionario'] = this.funcionario.toJson();
    }
    if (this.itens != null) {
      data['itens'] = this.itens.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String get title => cliente.nombre;

  @override
  String get subTitle => fechaEmision + '\n' + 'Estado: ' + condicion;

  @action
  setFechaEmision(String newFechaEmision) => fechaEmision = newFechaEmision;

  @action
  setCliente(Cliente newCliente) => cliente = newCliente;

  @action
  setFuncionario(Funcionario newFuncionario) => funcionario = newFuncionario;

  @action
  setObervacion(String newObervacion) => obervacion = newObervacion;

  @action
  setTipoVenta(String newCondicion) => condicion = newCondicion;

  @action
  setEstado(String newEstado) => estado = newEstado;

  @action
  setTotalVenta(double netTotalVenta) => totalVenta = netTotalVenta;

  @action
  String obervacionError() {
    if (obervacion == null || obervacion.isEmpty) {
      return 'La observacion es requerido';
    }
    if (obervacion.length < 5) {
      return 'La observacion no debe tener menos de 5 caráteres';
    }
    return null;
  }

  @action
  bool isValidObervacion() {
    if (obervacionError() != null) {
      return false;
    }

    return true;
  }

  @action
  String funcionarioError() {
    if (funcionario == null) {
      return 'El funcionario es requerido';
    }
    return null;
  }

  @action
  bool isValidFuncionario() {
    if (funcionarioError() != null) {
      return false;
    }

    return true;
  }

  @action
  String clienteError() {
    if (cliente == null) {
      return 'El cliente es requerido';
    }
    return null;
  }

  @action
  bool isValidCliente() {
    if (clienteError() != null) {
      return false;
    }

    return true;
  }

  @action
  String fechaEmisionError() {
    if (fechaEmision == null) {
      return 'El lote es requerido';
    }
    return null;
  }

  @action
  bool isValidFechaEmision() {
    if (fechaEmisionError() != null) {
      return false;
    }

    return true;
  }

  void recalcula() {
    var vlTotal = 0.0;
    for (var item in this.itens) {
      vlTotal = vlTotal + item.lote.precio;
    }
    this.totalVenta = vlTotal;
  }

  @action
  addItem(Itens itens) {
    this.itens.add(itens);
  }
}
