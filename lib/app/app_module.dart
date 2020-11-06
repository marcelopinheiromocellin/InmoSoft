import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inmo_soft/app/app_widget.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/configuracion_module.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/repository/configuracion_repository.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/registro_module.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/home/pages/configuracion/pages/empresa/configuracion_controller.dart';
import 'modules/home/pages/registro/pages/cliente/repository/cliente_repository.dart';
import 'modules/home/pages/registro/pages/funcionario/repository/funcionario_repository.dart';
import 'modules/home/pages/registro/pages/lote/repository/lote_repository.dart';
import 'modules/home/pages/ventas/ventas_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => ConfiguracionController(
            i.get(), i.get(), i.get(), i.get(), i.get())),
        Bind((i) => ConfiguracionRepository()),
        Bind((i) => ClienteRepository()),
        Bind((i) => FuncionarioRepository()),
        Bind((i) => LoteRepository()),
        Bind((i) => VentasRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/configuracion', module: ConfiguracionModule()),
        Router('/registro', module: RegistroModule()),
        Router('/ventas', module: VentasModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
