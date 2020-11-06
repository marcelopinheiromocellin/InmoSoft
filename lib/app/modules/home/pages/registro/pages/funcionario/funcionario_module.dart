import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/funcionario/funcionario_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/funcionario/funcionario_page.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/lista_funcionario/lista_funcionario_page.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/lista_funcionario/lista_funcionario_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';

class FuncionarioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FuncionarioController(i.get())),
        Bind((i) => ListaFuncionarioController(i.get())),
        Bind((i) => FuncionarioRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ListaFuncionarioPage()),
        Router("/funcionario", child: (_, args) => FuncionarioPage()),
      ];

  static Inject get to => Inject<FuncionarioModule>.of();
}
