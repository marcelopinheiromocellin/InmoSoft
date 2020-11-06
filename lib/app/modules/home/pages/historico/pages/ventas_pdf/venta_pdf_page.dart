import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/button/round_button.dart';
import 'package:inmo_soft/app/components/date_picker/date_picker.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/text_input.dart';
import 'package:inmo_soft/app/components/pdf/pdf_view.dart';
import 'package:inmo_soft/app/components/utils/date/date_utils.dart';
import 'package:inmo_soft/app/modules/home/pages/historico/pages/menu_reporte/menu_reporte_controller.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../app_controller.dart';

class VentasPdfPage extends StatefulWidget {
  VentasPdfPage({Key key}) : super(key: key);

  @override
  _VentasPdfPageState createState() => _VentasPdfPageState();
}

class _VentasPdfPageState extends State<VentasPdfPage> {
  MenuReporteController controller = Modular.get();
  TextEditingController desde = TextEditingController();
  TextEditingController hasta = TextEditingController();
  TextEditingController opciones = TextEditingController();

  //pdf desde aqui
  bool loading = false;
  File file;
  String filtroSeleccionado = 'ID_VENTA';
  String orderBySeleccionado = 'ID_VENTA';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  writeData(String data) async {
    Uint8List bytes = base64.decode(data);

    changeLoadingStatus(true);

    _localPath.then((dir) async {
      await File('$dir/ReporteVenta.pdf')
          .writeAsBytes(bytes)
          .then((file) async {
        await PDFDocument.fromFile(file).then((value) {
          Get.to(
              PDFView(document: value, title: "Reporte de ventas", file: file));
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

  List<String> filtro = ['ID', 'Nombre', 'Apellido'];
  List<String> ordenar = ['Nombre', 'Apellido'];

  String observacao;
  String tipoContato;

  final focusNode = FocusNode();
  final theme = Modular.get<AppController>();
  @override
  Widget build(BuildContext context) {
    final menuReporteController = Modular.get<MenuReporteController>();

    void loadPDF() {
      setState(() {
        String condition = " 1 = 1";

        if (desde.text == '' || hasta.text == '') {
          Alert.show("Atencion", "El filtro desde/hasta no estan informados",
              Alert.WARNING);
          return;
        } else {
          condition += " AND DATE(v.FECHA_EMISION) between DATE('" +
              desde.text +
              "') and DATE('" +
              hasta.text +
              "')";
        }

        loading = true;
        menuReporteController.findInformeVentas(condition).then((value) async {
          writeData(value);
        }).catchError((onError) {
          loading = false;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Reporte Venta"),
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
                    width: Get.width,
                    height: Get.height * .1,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Filtro por fecha',
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),

                  Container(
                    width: Get.width,
                    height: Get.height * .1,
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        DatePicker.show(
                            context,
                            DateTime.now(),
                            DateTime.now().subtract(Duration(days: 365)),
                            DateTime.now().add(
                              Duration(days: 365),
                            )).then((value) {
                          if (value != null) {
                            desde.text =
                                DateUtils.formatDateVenta(value.toString());
                          } else {
                            desde.text = '';
                          }
                        });
                      },
                      child: TextInput(
                        controller: desde,
                        icon: Icon(Icons.calendar_today),
                        label: "Fecha inicial",
                        enabled: false,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * .1,
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        DatePicker.show(
                            context,
                            DateTime.now(),
                            DateTime.now().subtract(Duration(days: 365)),
                            DateTime.now().add(
                              Duration(days: 365),
                            )).then((value) {
                          if (value != null) {
                            hasta.text =
                                DateUtils.formatDateVenta(value.toString());
                          } else {
                            hasta.text = '';
                          }
                        });
                      },
                      child: TextInput(
                        controller: hasta,
                        icon: Icon(Icons.calendar_today),
                        label: "Fecha final",
                        enabled: false,
                      ),
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
