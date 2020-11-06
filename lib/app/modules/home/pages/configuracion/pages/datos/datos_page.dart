import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/Animation/FadeAnimation.dart';
import 'package:inmo_soft/app/modules/home/pages/configuracion/pages/empresa/configuracion_controller.dart';

class DatosPage extends StatefulWidget {
  DatosPage({Key key}) : super(key: key);
  @override
  _DatosPageState createState() => _DatosPageState();
}

final configuracaoController = Modular.get<ConfiguracionController>();

class _DatosPageState extends State<DatosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(28, 90, 92, 1),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: FadeAnimation(
                  1.2,
                  GestureDetector(
                    onTap: () {
                      configuracaoController.deleteCliente();
                    },
                    child: Container(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Clientes',
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: Colors.black,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/registros/cliente.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            offset: Offset(10, 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FadeAnimation(
                  1.2,
                  GestureDetector(
                    onTap: () {
                      configuracaoController.deleteFuncionario();
                    },
                    child: Container(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Funcionario',
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/registros/funcionario.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            offset: Offset(10, 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FadeAnimation(
                  1.2,
                  GestureDetector(
                    onTap: () {
                      configuracaoController.deleteLote();
                    },
                    child: Container(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Lote',
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/registros/lote.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            offset: Offset(10, 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FadeAnimation(
                  1.2,
                  GestureDetector(
                    onTap: () {
                      configuracaoController.deleteItemVenda();
                    },
                    child: Container(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Itens de la venta',
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(10, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/registros/itens.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            offset: Offset(10, 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FadeAnimation(
                  1.2,
                  GestureDetector(
                    onTap: () {
                      configuracaoController.deleteVenta();
                    },
                    child: Container(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Venta',
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/registros/ventas.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            offset: Offset(10, 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
