import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/inputs/number_input/number_input_custom.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/form_input.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/pages/lote/lote_controller.dart';
import 'package:inmo_soft/app/utils/size_utils.dart';

import '../../../../../../../../app_controller.dart';

class LotePage extends StatefulWidget {
  LotePage({Key key}) : super(key: key);

  @override
  _LotePageState createState() => _LotePageState();
}

class _LotePageState extends State<LotePage> {
  final theme = Modular.get<AppController>();
  final loteController = Modular.get<LoteController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Registro de lote',
              style: GoogleFonts.montserrat(),
            ),
          ),
          body: SingleChildScrollView(
            child: Observer(
              builder: (_) => Container(
                  padding: EdgeInsets.all(10),
                  child: (loteController.processando
                      ? _loading(size)
                      : _body(size))),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(28, 90, 92, 1),
            onPressed: () {
              if (!loteController.lote.isValidNombre()) {
                Alert.show("Campo Requerido", "El nombre es requeridos",
                    Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidDireccion()) {
                Alert.show("Campo Requerido", "El dirección es requerido",
                    Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidPrecio()) {
                Alert.show(
                    "Campo Requerido", "El precio es requerido", Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidEstado()) {
                Alert.show(
                    "Campo Requerido", "El estado es requerido", Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidDimencion()) {
                Alert.show("Campo Requerido", "La dimención civil es requerido",
                    Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidCtacteCatastral()) {
                Alert.show(
                    "Campo Requerido",
                    "La Cuenta Corriente Catastral es requerido",
                    Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidManzana()) {
                Alert.show("Campo Requerido", "La manzana es requerido",
                    Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidBarrio()) {
                Alert.show("Campo Requerido",
                    "El barrio de ingreso es requerido", Alert.WARNING);
                return;
              }
              if (!loteController.lote.isValidLoteamiento()) {
                Alert.show("Campo Requerido", "El loteamiento es requerido",
                    Alert.WARNING);
                return;
              }
              loteController.save().then((value) {});
              Get.back();
            },
            child: Icon(Icons.save, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _loading(Size size) {
    return Center(
      child: Container(
        width: size.width * .4,
        height: size.height,
        padding: EdgeInsets.all(30),
        child: Center(
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ),
    );
  }

  _body(Size size) {
    return Column(
      children: <Widget>[
        Observer(
          builder: (_) => FormInput(
            label: "Nombre",
            text: loteController.lote?.nombre ?? '',
            errorText: loteController.lote.nombreError(),
            theme: theme,
            onChanged: loteController.lote.setNombre,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Dirección",
            text: loteController.lote?.direccion ?? '',
            errorText: loteController.lote.direccionError(),
            theme: theme,
            onChanged: loteController.lote.setDireccion,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (context) => NumberInputCustom(
              themeData: ThemeData(),
              numberValue: loteController.lote?.precio ?? 0.0,
              fontColor: Colors.black87,
              labelText: 'Precio',
              onChanged: (value) {
                loteController.lote.precio = value;
              },
              errorText: loteController.lote.precioError(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          width: SizeUtils.widthScreen,
          height: SizeUtils.heightScreen,
          child: Text(
            'Estado',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Observer(builder: (_) {
            print(loteController.lote.estado);
            return DropdownButton(
              value: loteController.lote.estado,
              isExpanded: true,
              dropdownColor: Colors.grey[100],
              iconEnabledColor: Color.fromRGBO(28, 90, 92, 1),
              iconDisabledColor: Colors.black,
              icon: Icon(Icons.work),
              items: [
                DropdownMenuItem(
                    child: Text(
                      'Activo',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Activo'),
                DropdownMenuItem(
                    child: Text(
                      "No activo",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'No activo'),
              ],
              onChanged: loteController.lote?.setEstado ?? 'Activo',
            );
          }),
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Dimencion",
            text: loteController.lote?.dimension ?? '',
            theme: theme,
            keyboardType: TextInputType.phone,
            errorText: loteController.lote.dimensionError(),
            onChanged: loteController.lote.setDimencion,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Cuenta Corriente Catastral",
            text: loteController.lote?.ctacteCatastral ?? '',
            theme: theme,
            errorText: loteController.lote.ctacteCatastralError(),
            onChanged: loteController.lote.setCtacteCatastral,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Manzana",
            text: loteController.lote?.manzana ?? '',
            theme: theme,
            errorText: loteController.lote.manzanaError(),
            onChanged: loteController.lote.setManzana,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Barrio",
            text: loteController.lote?.barrio ?? '',
            theme: theme,
            errorText: loteController.lote.barrioError(),
            onChanged: loteController.lote.setBarrio,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Loteamiento",
            text: loteController.lote?.loteamiento ?? '',
            theme: theme,
            errorText: loteController.lote.loteamientoError(),
            onChanged: loteController.lote.setLoteamiento,
          ),
        ),
      ],
    );
  }
}
