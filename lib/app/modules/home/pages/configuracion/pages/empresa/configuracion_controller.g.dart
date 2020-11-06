// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracion_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfiguracionController on _ConfiguracionControllerBase, Store {
  final _$currentRecordAtom =
      Atom(name: '_ConfiguracionControllerBase.currentRecord');

  @override
  Configuracion get currentRecord {
    _$currentRecordAtom.reportRead();
    return super.currentRecord;
  }

  @override
  set currentRecord(Configuracion value) {
    _$currentRecordAtom.reportWrite(value, super.currentRecord, () {
      super.currentRecord = value;
    });
  }

  final _$processandoAtom =
      Atom(name: '_ConfiguracionControllerBase.processando');

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

  final _$configuracionAtom =
      Atom(name: '_ConfiguracionControllerBase.configuracion');

  @override
  Configuracion get configuracion {
    _$configuracionAtom.reportRead();
    return super.configuracion;
  }

  @override
  set configuracion(Configuracion value) {
    _$configuracionAtom.reportWrite(value, super.configuracion, () {
      super.configuracion = value;
    });
  }

  final _$_ConfiguracionControllerBaseActionController =
      ActionController(name: '_ConfiguracionControllerBase');

  @override
  Future<Configuracion> findById() {
    final _$actionInfo = _$_ConfiguracionControllerBaseActionController
        .startAction(name: '_ConfiguracionControllerBase.findById');
    try {
      return super.findById();
    } finally {
      _$_ConfiguracionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentRecordChange(Configuracion newConfiguracion) {
    final _$actionInfo = _$_ConfiguracionControllerBaseActionController
        .startAction(name: '_ConfiguracionControllerBase.currentRecordChange');
    try {
      return super.currentRecordChange(newConfiguracion);
    } finally {
      _$_ConfiguracionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentRecord: ${currentRecord},
processando: ${processando},
configuracion: ${configuracion}
    ''';
  }
}
