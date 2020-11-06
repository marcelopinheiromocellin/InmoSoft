// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FuncionarioController on _FuncionarioControllerBase, Store {
  final _$currentRecordAtom =
      Atom(name: '_FuncionarioControllerBase.currentRecord');

  @override
  Funcionario get currentRecord {
    _$currentRecordAtom.reportRead();
    return super.currentRecord;
  }

  @override
  set currentRecord(Funcionario value) {
    _$currentRecordAtom.reportWrite(value, super.currentRecord, () {
      super.currentRecord = value;
    });
  }

  final _$processandoAtom =
      Atom(name: '_FuncionarioControllerBase.processando');

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

  final _$_FuncionarioControllerBaseActionController =
      ActionController(name: '_FuncionarioControllerBase');

  @override
  Future<dynamic> findByCondition(String nombre) {
    final _$actionInfo = _$_FuncionarioControllerBaseActionController
        .startAction(name: '_FuncionarioControllerBase.findByCondition');
    try {
      return super.findByCondition(nombre);
    } finally {
      _$_FuncionarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<Funcionario> findByDocumento() {
    final _$actionInfo = _$_FuncionarioControllerBaseActionController
        .startAction(name: '_FuncionarioControllerBase.findByDocumento');
    try {
      return super.findByDocumento();
    } finally {
      _$_FuncionarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentRecordChange(Funcionario newFuncionario) {
    final _$actionInfo = _$_FuncionarioControllerBaseActionController
        .startAction(name: '_FuncionarioControllerBase.currentRecordChange');
    try {
      return super.currentRecordChange(newFuncionario);
    } finally {
      _$_FuncionarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentRecord: ${currentRecord},
processando: ${processando}
    ''';
  }
}
