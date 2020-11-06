import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/itens.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/ventas.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/repository/ventas_repository.dart';
import 'package:mobx/mobx.dart';

part 'registro_controller.g.dart';

class RegistroController = _RegistroControllerBase with _$RegistroController;

abstract class _RegistroControllerBase with Store {}
