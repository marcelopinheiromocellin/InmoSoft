// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracion.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Configuracion on _ConfiguracionBase, Store {
  final _$nombreAtom = Atom(name: '_ConfiguracionBase.nombre');

  @override
  String get nombre {
    _$nombreAtom.reportRead();
    return super.nombre;
  }

  @override
  set nombre(String value) {
    _$nombreAtom.reportWrite(value, super.nombre, () {
      super.nombre = value;
    });
  }

  final _$telefonoAtom = Atom(name: '_ConfiguracionBase.telefono');

  @override
  String get telefono {
    _$telefonoAtom.reportRead();
    return super.telefono;
  }

  @override
  set telefono(String value) {
    _$telefonoAtom.reportWrite(value, super.telefono, () {
      super.telefono = value;
    });
  }

  final _$rucAtom = Atom(name: '_ConfiguracionBase.ruc');

  @override
  String get ruc {
    _$rucAtom.reportRead();
    return super.ruc;
  }

  @override
  set ruc(String value) {
    _$rucAtom.reportWrite(value, super.ruc, () {
      super.ruc = value;
    });
  }

  final _$_ConfiguracionBaseActionController =
      ActionController(name: '_ConfiguracionBase');

  @override
  dynamic setNombre(String newNombre) {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.setNombre');
    try {
      return super.setNombre(newNombre);
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelefono(String newTelefono) {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.setTelefono');
    try {
      return super.setTelefono(newTelefono);
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRuc(String newRuc) {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.setRuc');
    try {
      return super.setRuc(newRuc);
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String nombreError() {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.nombreError');
    try {
      return super.nombreError();
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidNombre() {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.isValidNombre');
    try {
      return super.isValidNombre();
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String telefonoError() {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.telefonoError');
    try {
      return super.telefonoError();
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidTelefono() {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.isValidTelefono');
    try {
      return super.isValidTelefono();
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String rucError() {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.rucError');
    try {
      return super.rucError();
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidRuc() {
    final _$actionInfo = _$_ConfiguracionBaseActionController.startAction(
        name: '_ConfiguracionBase.isValidRuc');
    try {
      return super.isValidRuc();
    } finally {
      _$_ConfiguracionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nombre: ${nombre},
telefono: ${telefono},
ruc: ${ruc}
    ''';
  }
}
