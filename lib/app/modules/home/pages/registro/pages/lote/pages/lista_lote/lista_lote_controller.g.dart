// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_lote_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaLoteController on _ListaLoteControllerBase, Store {
  final _$dataProviderAtom =
      Atom(name: '_ListaLoteControllerBase.dataProvider');

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

  final _$processandoAtom = Atom(name: '_ListaLoteControllerBase.processando');

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

  final _$loteAtom = Atom(name: '_ListaLoteControllerBase.lote');

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

  @override
  ObservableFuture<List<Lote>> findAll(
      String nombre, String manzana, String loteamiento) {
    final _$future = super.findAll(nombre, manzana, loteamiento);
    return ObservableFuture<List<Lote>>(_$future);
  }

  @override
  String toString() {
    return '''
dataProvider: ${dataProvider},
processando: ${processando},
lote: ${lote}
    ''';
  }
}
