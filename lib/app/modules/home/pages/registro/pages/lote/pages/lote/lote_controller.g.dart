// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lote_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoteController on _LoteControllerBase, Store {
  final _$loteAtom = Atom(name: '_LoteControllerBase.lote');

  @override
  Lote get lote {
    _$loteAtom.reportRead();
    return super.lote;
  }

  @override
  set lote(Lote value) {
    _$loteAtom.reportWrite(value, super.lote, () {
      super.lote = value;
    });
  }

  final _$processandoAtom = Atom(name: '_LoteControllerBase.processando');

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

  final _$_LoteControllerBaseActionController =
      ActionController(name: '_LoteControllerBase');

  @override
  Future<dynamic> findByCondition(String nombre) {
    final _$actionInfo = _$_LoteControllerBaseActionController.startAction(
        name: '_LoteControllerBase.findByCondition');
    try {
      return super.findByCondition(nombre);
    } finally {
      _$_LoteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentRecordChange(Lote newLote) {
    final _$actionInfo = _$_LoteControllerBaseActionController.startAction(
        name: '_LoteControllerBase.currentRecordChange');
    try {
      return super.currentRecordChange(newLote);
    } finally {
      _$_LoteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lote: ${lote},
processando: ${processando}
    ''';
  }
}
