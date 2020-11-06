// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VentasController on _VentasControllerBase, Store {
  final _$ventasAtom = Atom(name: '_VentasControllerBase.ventas');

  @override
  Ventas get ventas {
    _$ventasAtom.reportRead();
    return super.ventas;
  }

  @override
  set ventas(Ventas value) {
    _$ventasAtom.reportWrite(value, super.ventas, () {
      super.ventas = value;
    });
  }

  final _$listaItensSeleccionadoAtom =
      Atom(name: '_VentasControllerBase.listaItensSeleccionado');

  @override
  Itens get listaItensSeleccionado {
    _$listaItensSeleccionadoAtom.reportRead();
    return super.listaItensSeleccionado;
  }

  @override
  set listaItensSeleccionado(Itens value) {
    _$listaItensSeleccionadoAtom
        .reportWrite(value, super.listaItensSeleccionado, () {
      super.listaItensSeleccionado = value;
    });
  }

  final _$dataProviderAtom = Atom(name: '_VentasControllerBase.dataProvider');

  @override
  ObservableList<Lote> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<Lote> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  final _$processandoAtom = Atom(name: '_VentasControllerBase.processando');

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

  final _$_VentasControllerBaseActionController =
      ActionController(name: '_VentasControllerBase');

  @override
  void addLote(Lote lote) {
    final _$actionInfo = _$_VentasControllerBaseActionController.startAction(
        name: '_VentasControllerBase.addLote');
    try {
      return super.addLote(lote);
    } finally {
      _$_VentasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLoteLista() {
    final _$actionInfo = _$_VentasControllerBaseActionController.startAction(
        name: '_VentasControllerBase.addLoteLista');
    try {
      return super.addLoteLista();
    } finally {
      _$_VentasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItensLista() {
    final _$actionInfo = _$_VentasControllerBaseActionController.startAction(
        name: '_VentasControllerBase.removeItensLista');
    try {
      return super.removeItensLista();
    } finally {
      _$_VentasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<Ventas> save() {
    final _$actionInfo = _$_VentasControllerBaseActionController.startAction(
        name: '_VentasControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_VentasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentRecordChange(Ventas newVentas) {
    final _$actionInfo = _$_VentasControllerBaseActionController.startAction(
        name: '_VentasControllerBase.currentRecordChange');
    try {
      return super.currentRecordChange(newVentas);
    } finally {
      _$_VentasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ventas: ${ventas},
listaItensSeleccionado: ${listaItensSeleccionado},
dataProvider: ${dataProvider},
processando: ${processando}
    ''';
  }
}
