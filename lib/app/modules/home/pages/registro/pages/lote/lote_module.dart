import 'package:flutter_modular/flutter_modular.dart';

import 'pages/lista_lote/lista_lote_controller.dart';
import 'pages/lista_lote/lista_lote_page.dart';
import 'pages/lote/lote_controller.dart';
import 'pages/lote/lote_page.dart';
import 'repository/lote_repository.dart';

class LoteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoteController(i.get())),
        Bind((i) => ListaLoteController(i.get())),
        Bind((i) => LoteRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ListaLotePage()),
        Router("/lote", child: (_, args) => LotePage()),
      ];

  static Inject get to => Inject<LoteModule>.of();
}
