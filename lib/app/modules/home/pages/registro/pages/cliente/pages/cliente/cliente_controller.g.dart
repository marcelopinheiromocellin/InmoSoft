// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteController on _ClienteControllerBase, Store {
  final _$clienteAtom = Atom(name: '_ClienteControllerBase.cliente');

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

  final _$dataProviderAtom = Atom(name: '_ClienteControllerBase.dataProvider');

  @override
  ObservableList<Cliente> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<Cliente> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  final _$processandoAtom = Atom(name: '_ClienteControllerBase.processando');

  @override
  bool get processando {
    _$processandoAtom.reportRead();
    return super.processando;
  }

  @override
  set processando(bool value) {
    _$processandoAtom.reportWrite(value, super.processando, () {
      super.processando = value;
    });
  }

  final _$_ClienteControllerBaseActionController =
      ActionController(name: '_ClienteControllerBase');

  @override
  Future<dynamic> findByCondition(String nombre) {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction(
        name: '_ClienteControllerBase.findByCondition');
    try {
      return super.findByCondition(nombre);
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Cliente>> findByNombreAndApellido(
      String nombre, String apellido) {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction(
        name: '_ClienteControllerBase.findByNombreAndApellido');
    try {
      return super.findByNombreAndApellido(nombre, apellido);
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<Cliente> findByDocumento() {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction(
        name: '_ClienteControllerBase.findByDocumento');
    try {
      return super.findByDocumento();
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentRecordChange(Cliente newCliente) {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction(
        name: '_ClienteControllerBase.currentRecordChange');
    try {
      return super.currentRecordChange(newCliente);
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cliente: ${cliente},
dataProvider: ${dataProvider},
processando: ${processando}
    ''';
  }
}
