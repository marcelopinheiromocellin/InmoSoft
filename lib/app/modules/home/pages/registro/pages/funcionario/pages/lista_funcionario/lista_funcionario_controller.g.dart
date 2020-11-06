// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_funcionario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaFuncionarioController on _ListaFuncionarioControllerBase, Store {
  final _$dataProviderAtom =
      Atom(name: '_ListaFuncionarioControllerBase.dataProvider');

  @override
  ObservableList<Funcionario> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<Funcionario> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  final _$processandoAtom =
      Atom(name: '_ListaFuncionarioControllerBase.processando');

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

  final _$funcionarioAtom =
      Atom(name: '_ListaFuncionarioControllerBase.funcionario');

  @override
  Funcionario get funcionario {
    _$funcionarioAtom.reportRead();
    return super.funcionario;
  }

  @override
  set funcionario(Funcionario value) {
    _$funcionarioAtom.reportWrite(value, super.funcionario, () {
      super.funcionario = value;
    });
  }

  @override
  ObservableFuture<List<Funcionario>> findByNombre(
      String nombre, String apellido) {
    final _$future = super.findByNombre(nombre, apellido);
    return ObservableFuture<List<Funcionario>>(_$future);
  }

  @override
  String toString() {
    return '''
dataProvider: ${dataProvider},
processando: ${processando},
funcionario: ${funcionario}
    ''';
  }
}
