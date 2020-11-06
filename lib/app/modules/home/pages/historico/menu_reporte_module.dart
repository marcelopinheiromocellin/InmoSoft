import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/historico_cliente/historico_cliente_page.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/historico_funcionario/historico_funcionario_page.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/historico_lote/historico_lote_page.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/menu_reporte/menu_reporte_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/menu_reporte/menu_reporte_page.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/ventas_pdf/venta_pdf_page.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/pages/cliente/cliente_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/funcionario/funcionario_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/pages/lote/lote_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/repository/lote_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/ventas/ventas_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';

class MenuReporteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenuReporteController(i.get(), i.get(), i.get(),i.get())),
        Bind((i) => ClienteController(i.get())),
        Bind((i) => FuncionarioController(i.get())),
        Bind((i) => LoteController(i.get())),
        Bind((i) => VentasController(i.get())),
        Bind((i) => ClienteRepository()),
        Bind((i) => FuncionarioRepository()),
        Bind((i) => ClienteRepository()),
        Bind((i) => LoteRepository()),
        Bind((i) => VentasRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MenuReportePage()),
        Router('/historicoFuncionario',
            child: (_, args) => HistoricoFuncionarioPage()),
        Router('/historicoCliente', child: (_, args) => HistoricoClientePage()),
        Router('/historicoLote', child: (_, args) => HistoricoLotePage()),
        Router('/ventaPdf', child: (_, args) => VentasPdfPage()),
      ];

  static Inject get to => Inject<MenuReporteModule>.of();
}
