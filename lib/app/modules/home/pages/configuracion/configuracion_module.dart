import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/pages/datos/datos_page.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/pages/empresa/configuracion_page.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/pages/sub_menu/sub_menu_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/pages/sub_menu/sub_menu_page.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/repository/configuracion_repository.dart';

class ConfiguracionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SubMenuController(i.get())),
        Bind((i) => ConfiguracionRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SubMenuPage()),
        Router('/empresa', child: (_, args) => ConfiguracionPage()),
        Router('/datos', child: (_, args) => DatosPage()),
        Router('/configuracion', child: (_, args) => ConfiguracionPage()),
      ];

  static Inject get to => Inject<ConfiguracionModule>.of();
}
