import 'package:flutter/material.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/repository/configuracion_repository.dart';
import 'package:mobx/mobx.dart';

part 'datos_controller.g.dart';

class DatosController = _DatosControllerBase with _$DatosController;

abstract class _DatosControllerBase with Store {}
