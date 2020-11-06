// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubMenuController on _SubMenuControllerBase, Store {
  final _$currentRecordAtom =
      Atom(name: '_SubMenuControllerBase.currentRecord');

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

  final _$processandoAtom = Atom(name: '_SubMenuControllerBase.processando');

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

  final _$_SubMenuControllerBaseActionController =
      ActionController(name: '_SubMenuControllerBase');

  @override
  dynamic currentRecordChange(Configuracion newConfiguracion) {
    final _$actionInfo = _$_SubMenuControllerBaseActionController.startAction(
        name: '_SubMenuControllerBase.currentRecordChange');
    try {
      return super.currentRecordChange(newConfiguracion);
    } finally {
      _$_SubMenuControllerBaseActionController.endAction(_$actionInfo);
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
