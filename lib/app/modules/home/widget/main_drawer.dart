import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/Animation/FadeAnimation.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  //foto de la empresa
  String foto;
  Widget getFoto() {
    Widget avatar;

    if (foto == null) {
      avatar = CircleAvatar(
        radius: 100.0,
        child: Image(image: AssetImage('assets/icons/user-icon.png')),
        backgroundColor: Colors.transparent,
      );
    } else {
      var decoded = base64.decode(foto);
      final image = Image.memory(decoded, fit: BoxFit.cover);
      avatar = Container(
        color: Color(0xFF052744),
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .23,
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: Image.memory(decoded).image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return avatar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .73,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .37,
                color: Color.fromRGBO(28, 90, 92, 1),
                child: Column(
                  children: <Widget>[
                    // FadeAnimation(
                    //     1.8,
                    //     CircleAvatar(
                    //       radius: 70,
                    //     )),
                    // FadeAnimation(
                    //   1.9,
                    //   Text(
                    //     'Usuario',
                    //     style: GoogleFonts.montserrat(
                    //       fontSize: 20,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                FadeAnimation(
                  1,
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Color.fromRGBO(28, 90, 92, 1),
                    ),
                    title: Text(
                      'Registro',
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                    onTap: () {
                      Get.toNamed('/registro');
                    },
                  ),
                ),
                FadeAnimation(
                  1.2,
                  ListTile(
                    leading: Icon(
                      Icons.shopping_cart,
                      color: Color.fromRGBO(28, 90, 92, 1),
                    ),
                    title: Text(
                      'Venta',
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                    onTap: () {
                      Get.toNamed('/ventas');
                    },
                  ),
                ),
                FadeAnimation(
                  1.3,
                  ListTile(
                    leading: Icon(
                      Icons.receipt,
                      color: Color.fromRGBO(28, 90, 92, 1),
                    ),
                    title: Text(
                      'Reporte',
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                    onTap: () {
                      Get.toNamed('/menuReporte');
                    },
                  ),
                ),
                FadeAnimation(
                    1.4,
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Color.fromRGBO(28, 90, 92, 1),
                      ),
                      title: Text(
                        'Configuración',
                        style: GoogleFonts.montserrat(fontSize: 20),
                      ),
                      onTap: () {
                        Get.toNamed('/configuracion');
                      },
                    )),
                Divider(
                  height: 20,
                ),
                FadeAnimation(
                  1.5,
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Color.fromRGBO(28, 90, 92, 1),
                    ),
                    title: Container(
                      child: Text(
                        'Salir',
                        style: GoogleFonts.montserrat(fontSize: 20),
                      ),
                    ),
                    onTap: () {
                      _onBackPressed();
                    },
                  ),
                ),
              ],
            ),
          ],
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
