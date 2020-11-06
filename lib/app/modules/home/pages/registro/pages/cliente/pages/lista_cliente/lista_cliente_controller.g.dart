// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaClienteController on _ListaClienteControllerBase, Store {
  final _$dataProviderAtom =
      Atom(name: '_ListaClienteControllerBase.dataProvider');

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

  final _$processandoAtom =
      Atom(name: '_ListaClienteControllerBase.processando');

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

  final _$clienteAtom = Atom(name: '_ListaClienteControllerBase.cliente');

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

  @override
  ObservableFuture<List<Cliente>> findByNombreAndApellido(
      String nombre, String apellido) {
    final _$future = super.findByNombreAndApellido(nombre, apellido);
    return ObservableFuture<List<Cliente>>(_$future);
  }

  @override
  String toString() {
    return '''
dataProvider: ${dataProvider},
processando: ${processando},
cliente: ${cliente}
    ''';
  }
}
