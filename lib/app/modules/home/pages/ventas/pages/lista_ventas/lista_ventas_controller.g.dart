// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_ventas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaVentaController on _ListaVentaControllerBase, Store {
  final _$dataProviderAtom =
      Atom(name: '_ListaVentaControllerBase.dataProvider');

  @override
  ObservableList<Ventas> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<Ventas> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  final _$processandoAtom = Atom(name: '_ListaVentaControllerBase.processando');

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

  final _$ventasAtom = Atom(name: '_ListaVentaControllerBase.ventas');

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

  @override
  ObservableFuture<List<Ventas>> findAll() {
    final _$future = super.findAll();
    return ObservableFuture<List<Ventas>>(_$future);
  }

  @override
  String toString() {
    return '''
dataProvider: ${dataProvider},
processando: ${processando},
ventas: ${ventas}
    ''';
  }
}
