import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/funcionario_module.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/lote_module.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/pages/lote/lote_page.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/registro/registro_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/registro/registro_page.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/lista_ventas/lista_ventas_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/lista_ventas/lista_ventas_page.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/ventas/ventas_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/ventas_module.dart';

import 'pages/cliente/cliente_module.dart';

class RegistroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegistroController()),
        Bind((i) => ListaVentaController(i.get())),
        Bind((i) => VentasController(i.get())),
        Bind((i) => VentasRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegistroPage()),
        Router('/cliente', module: ClienteModule()),
        Router('/funcionario', module: FuncionarioModule()),
        Router('/lote', module: LoteModule()),
        Router('/ventas', module: VentasModule()),
        Router('/loteLista', child: (_, args) => LotePage()),
        Router('/ventaLista', child: (_, args) => ListaVentasPage()),
      ];

  static Inject get to => Inject<RegistroModule>.of();
}
