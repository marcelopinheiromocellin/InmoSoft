import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/Animation/FadeAnimation.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/pages/empresa/configuracion_controller.dart';
import 'package:inmo_soft/app/modules/home/widget/main_drawer.dart';
import 'package:inmo_soft/app/utils/size_utils.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //use 'controller' variable to access controller
  final ConfiguracionController configuracionController = Modular.get();

  @override
  void initState() {
    configuracionController.findById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Pantalla de inicio',
              style: GoogleFonts.montserrat(),
            ),
            centerTitle: true,
          ),
          drawer: MainDrawer(),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .89,
              decoration: BoxDecoration(
                color: Color.fromRGBO(28, 90, 92, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: SizeUtils.widthScreen,
                    height: SizeUtils.heightScreen,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: Get.height * .3,
                        ),
                        Observer(
                          builder: (_) => Text(
                            configuracionController.currentRecord?.nombre ?? '',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(10.0, 10.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) => Text(
                            configuracionController.currentRecord?.telefono ??
                                '',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(10.0, 10.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: SizeUtils.widthScreen,
                    height: SizeUtils.heightScreen,
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          1.5,
                          ListTile(
                            title: Text(
                              'Marcelo Pinheiro Mocellin',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Text(
                              'Verción 1.3.0',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onBackPressed() {
    return Get.defaultDialog(
          middleText: 'Estas segura que desseas salir del sistema?',
          onCancel: () {},
          confirmTextColor: Colors.white,
          onConfirm: () => exit(0),
        ) ??
        false;
  }
}
