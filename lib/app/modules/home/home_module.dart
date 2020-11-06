import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/configuracion_module.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/menu_reporte_module.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/ventas_module.dart';
import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';
import 'pages/registro/registro_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/registro', module: RegistroModule()),
        Router('/ventas', module: VentasModule()),
        Router('/configuracion', module: ConfiguracionModule()),
        Router('/menuReporte', module: MenuReporteModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
