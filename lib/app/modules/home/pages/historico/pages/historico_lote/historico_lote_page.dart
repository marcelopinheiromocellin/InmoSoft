import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/button/round_button.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/text_input.dart';
import 'package:inmo_soft/app/components/pdf/pdf_view.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/menu_reporte/menu_reporte_controller.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../app_controller.dart';

class HistoricoLotePage extends StatefulWidget {
  HistoricoLotePage({Key key}) : super(key: key);

  @override
  _HistoricoLotePageState createState() => _HistoricoLotePageState();
}

class _HistoricoLotePageState extends State<HistoricoLotePage> {
  MenuReporteController controller = Modular.get();
  TextEditingController desde = TextEditingController();
  TextEditingController hasta = TextEditingController();
  TextEditingController opciones = TextEditingController();

  //pdf desde aqui
  bool loading = false;
  File file;
  String filtroSeleccionado = 'ID_LOTE';
  String orderBySeleccionado = 'ID_LOTE';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  writeData(String data) async {
    Uint8List bytes = base64.decode(data);

    changeLoadingStatus(true);

    _localPath.then((dir) async {
      await File('$dir/ReporteLote.pdf').writeAsBytes(bytes).then((file) async {
        await PDFDocument.fromFile(file).then((value) {
          Get.to(PDFView(document: value, title: "Reporte de lotes", file: file));
          //Get.to(PDFViewer(document: value));
          changeLoadingStatus(false);
          return value;
        }).catchError((onError) => changeLoadingStatus(false));
        return file;
      }).catchError((onError) => changeLoadingStatus(false));
    });
  }

  changeLoadingStatus(bool consultando) {
    setState(() {
      loading = consultando;
    });
  }
  //hasta aqui

  @override
  Widget build(BuildContext context) {
    final menuReporteController = Modular.get<MenuReporteController>();

    void loadPDF() {
      setState(() {
        String condition = " 1 = 1";

        int precioDesde = int.parse(desde.text);
        int precioHasta = int.parse(hasta.text);

        if (desde.text == '' || hasta.text == '') {
          Alert.show("Atencion", "El filtro desde/hasta no estan informados",
              Alert.WARNING);
          return;
        }
        if (filtroSeleccionado == 'ID_LOTE') {
          condition +=
              " and l.id_lote between '${desde.text}' and '${hasta.text}'";
        }
        if (filtroSeleccionado == 'Nombre') {
          condition +=
              " and l.nombre between '${desde.text}' and '${hasta.text}'";
        }
        if (filtroSeleccionado == 'Precio') {
          condition +=
              " and l.precio between '${precioDesde.toInt()}' and '${precioHasta.toInt()}'";
        }

        if (opciones.text.isNotEmpty) {
          condition += " and $filtroSeleccionado like '%${opciones.text}%'";
        }

        if (orderBySeleccionado.isNotEmpty) {
          condition += " order by $orderBySeleccionado";
        }

        loading = true;
        menuReporteController.findReporteLote(condition).then((value) async {
          writeData(value);
        }).catchError((onError) {
          loading = false;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Reporte Lote"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height * .89,
          child: Stack(
            children: <Widget>[
              Container(
                width: Get.width,
                height: Get.height,
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    width: Get.width,
                    height: 40,
                    child: Text(
                      'Filtro',
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          filtroSeleccionado = value;
                        });
                      },
                      value: filtroSeleccionado,
                      elevation: 30,
                      isExpanded: true,
                      icon: Icon(Icons.reorder),
                      dropdownColor: Colors.grey[100],
                      iconEnabledColor: Color(0xFF052744),
                      iconDisabledColor: Colors.black,
                      items: [
                        DropdownMenuItem(
                            child: Text(
                              "ID_LOTE",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                              ),
                            ),
                            value: 'ID_LOTE'),
                        DropdownMenuItem(
                          child: Text(
                            "Nombre",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
                          ),
                          value: 'Nombre',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Precio",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
                          ),
                          value: 'Precio',
                        ),
                      ],
                    ),
                  ),
                  TextInput(
                    label: "Desde",
                    controller: desde,
                  ),
                  TextInput(
                    label: "Hasta",
                    controller: hasta,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    width: Get.width,
                    height: 40,
                    child: Text(
                      'Ordenar',
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          orderBySeleccionado = value;
                        });
                      },
                      elevation: 30,
                      isExpanded: true,
                      value: orderBySeleccionado,
                      icon: Icon(Icons.reorder),
                      dropdownColor: Colors.grey[100],
                      iconEnabledColor: Color(0xFF052744),
                      iconDisabledColor: Colors.black,
                      items: [
                        DropdownMenuItem(
                            child: Text(
                              "ID_LOTE",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                              ),
                            ),
                            value: 'ID_LOTE'),
                        DropdownMenuItem(
                          child: Text(
                            "Nombre",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
                          ),
                          value: 'Nombre',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Precio",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
                          ),
                          value: 'Precio',
                        ),
                      ],
                    ),
                  ),

                   Container(
                    padding: EdgeInsets.only(top: 10),
                    width: Get.width,
                    height: Get.height * .08,
                    child: RoundButton(
                        label: "Generar",
                        color: Colors.green,
                        onTap: () {
                          loadPDF();
                        }),
                  ),

                  //  PDFViewer(document: document)
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
