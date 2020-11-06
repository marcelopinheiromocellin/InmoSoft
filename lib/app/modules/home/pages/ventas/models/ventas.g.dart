// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventas.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Ventas on _VentasBase, Store {
  final _$fechaEmisionAtom = Atom(name: '_VentasBase.fechaEmision');

  @override
  String get fechaEmision {
    _$fechaEmisionAtom.reportRead();
    return super.fechaEmision;
  }

  @override
  set fechaEmision(String value) {
    _$fechaEmisionAtom.reportWrite(value, super.fechaEmision, () {
      super.fechaEmision = value;
    });
  }

  final _$condicionAtom = Atom(name: '_VentasBase.condicion');

  @override
  String get condicion {
    _$condicionAtom.reportRead();
    return super.condicion;
  }

  @override
  set condicion(String value) {
    _$condicionAtom.reportWrite(value, super.condicion, () {
      super.condicion = value;
    });
  }

  final _$estadoAtom = Atom(name: '_VentasBase.estado');

  @override
  String get estado {
    _$estadoAtom.reportRead();
    return super.estado;
  }

  @override
  set estado(String value) {
    _$estadoAtom.reportWrite(value, super.estado, () {
      super.estado = value;
    });
  }

  final _$totalVentaAtom = Atom(name: '_VentasBase.totalVenta');

  @override
  double get totalVenta {
    _$totalVentaAtom.reportRead();
    return super.totalVenta;
  }

  @override
  set totalVenta(double value) {
    _$totalVentaAtom.reportWrite(value, super.totalVenta, () {
      super.totalVenta = value;
    });
  }

  final _$obervacionAtom = Atom(name: '_VentasBase.obervacion');

  @override
  String get obervacion {
    _$obervacionAtom.reportRead();
    return super.obervacion;
  }

  @override
  set obervacion(String value) {
    _$obervacionAtom.reportWrite(value, super.obervacion, () {
      super.obervacion = value;
    });
  }

  final _$clienteAtom = Atom(name: '_VentasBase.cliente');

  @override
  Cliente get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(Cliente value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$funcionarioAtom = Atom(name: '_VentasBase.funcionario');

  @override
  Funcionario get funcionario {
    _$funcionarioAtom.reportRead();
    return super.funcionario;
  }

  @override
  set funcionario(Funcionario value) {
    _$funcionarioAtom.reportWrite(value, super.funcionario, () {
      super.funcionario = value;
    });
  }

  final _$itensAtom = Atom(name: '_VentasBase.itens');

  @override
  ObservableList<Itens> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(ObservableList<Itens> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  final _$_VentasBaseActionController = ActionController(name: '_VentasBase');

  @override
  dynamic setFechaEmision(String newFechaEmision) {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.setFechaEmision');
    try {
      return super.setFechaEmision(newFechaEmision);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCliente(Cliente newCliente) {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.setCliente');
    try {
      return super.setCliente(newCliente);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFuncionario(Funcionario newFuncionario) {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.setFuncionario');
    try {
      return super.setFuncionario(newFuncionario);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObervacion(String newObervacion) {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.setObervacion');
    try {
      return super.setObervacion(newObervacion);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipoVenta(String newCondicion) {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.setTipoVenta');
    try {
      return super.setTipoVenta(newCondicion);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEstado(String newEstado) {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.setEstado');
    try {
      return super.setEstado(newEstado);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTotalVenta(double netTotalVenta) {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.setTotalVenta');
    try {
      return super.setTotalVenta(netTotalVenta);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String obervacionError() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.obervacionError');
    try {
      return super.obervacionError();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidObervacion() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.isValidObervacion');
    try {
      return super.isValidObervacion();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String funcionarioError() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.funcionarioError');
    try {
      return super.funcionarioError();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidFuncionario() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.isValidFuncionario');
    try {
      return super.isValidFuncionario();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String clienteError() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.clienteError');
    try {
      return super.clienteError();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidCliente() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.isValidCliente');
    try {
      return super.isValidCliente();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String fechaEmisionError() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.fechaEmisionError');
    try {
      return super.fechaEmisionError();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidFechaEmision() {
    final _$actionInfo = _$_VentasBaseActionController.startAction(
        name: '_VentasBase.isValidFechaEmision');
    try {
      return super.isValidFechaEmision();
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItem(Itens itens) {
    final _$actionInfo =
        _$_VentasBaseActionController.startAction(name: '_VentasBase.addItem');
    try {
      return super.addItem(itens);
    } finally {
      _$_VentasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fechaEmision: ${fechaEmision},
condicion: ${condicion},
estado: ${estado},
totalVenta: ${totalVenta},
obervacion: ${obervacion},
cliente: ${cliente},
funcionario: ${funcionario},
itens: ${itens}
    ''';
  }
}
