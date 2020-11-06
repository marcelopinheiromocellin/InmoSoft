import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'pages/cliente/cliente_controller.dart';
import 'pages/cliente/cliente_page.dart';
import 'pages/lista_cliente/lista_cliente_controller.dart';
import 'pages/lista_cliente/lista_clientes_page.dart';

class ClienteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClienteController(i.get())),
        Bind((i) => ListaClienteController(i.get())),
        Bind((i) => ClienteRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ListaClientePage()),
        Router("/cliente", child: (_, args) => ClientePage()),
      ];

  static Inject get to => Inject<ClienteModule>.of();
}
