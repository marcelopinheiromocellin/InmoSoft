// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Itens on _ItensBase, Store {
  final _$loteAtom = Atom(name: '_ItensBase.lote');

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

  final _$_ItensBaseActionController = ActionController(name: '_ItensBase');

  @override
  dynamic setLote(Lote newLote) {
    final _$actionInfo =
        _$_ItensBaseActionController.startAction(name: '_ItensBase.setLote');
    try {
      return super.setLote(newLote);
    } finally {
      _$_ItensBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lote: ${lote}
    ''';
  }
}
