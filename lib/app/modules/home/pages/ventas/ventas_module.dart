import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/pages/cliente/cliente_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/funcionario/funcionario_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/pages/lote/lote_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/repository/lote_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/lista_ventas/lista_ventas_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/lista_ventas/lista_ventas_page.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/menu_venta/menu_venta_page.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/ventas/ventas_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/ventas/ventas_page.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';

class VentasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => VentasController(i.get())),
        Bind((i) => ClienteController(i.get())),
        Bind((i) => FuncionarioController(i.get())),
        Bind((i) => LoteController(i.get())),
        Bind((i) => ListaVentaController(i.get())),
        Bind((i) => VentasRepository()),
        Bind<ClienteRepository>((i) => ClienteRepository()),
        Bind<FuncionarioRepository>((i) => FuncionarioRepository()),
        Bind<LoteRepository>((i) => LoteRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MenuVentaPage()),
        Router('/ventas', child: (_, args) => VentasPage()),
        Router('/lista_ventas', child: (_, args) => ListaVentasPage()),
      ];

  static Inject get to => Inject<VentasModule>.of();
}
