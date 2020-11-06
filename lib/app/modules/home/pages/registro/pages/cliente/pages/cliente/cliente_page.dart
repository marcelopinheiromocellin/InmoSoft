import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/date_field/date_field.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/form_input.dart';
import 'package:inmo_soft/app/utils/size_utils.dart';

import '../../../../../../../../app_controller.dart';
import 'cliente_controller.dart';

class ClientePage extends StatefulWidget {
  ClientePage({Key key}) : super(key: key);
  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final theme = Modular.get<AppController>();
  final clienteController = Modular.get<ClienteController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Registro de cliente',
              style: GoogleFonts.montserrat(),
            ),
          ),
          body: SingleChildScrollView(
            child: Observer(
              builder: (_) => Container(
                  padding: EdgeInsets.all(10),
                  child: (clienteController.processando
                      ? _loading(size)
                      : _body(size))),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(28, 90, 92, 1),
            onPressed: () {
              if (!clienteController.cliente.isValidDocumento()) {
                Alert.show("Campo Requerido", "El documento es requerido",
                    Alert.ERROR);
                return;
              }
              if (!clienteController.cliente.isValidNombre()) {
                Alert.show(
                    "Campo Requerido", "El nombre es requeridos", Alert.ERROR);
                return;
              }
              if (!clienteController.cliente.isValidApellido()) {
                Alert.show("Campo Requerido", "El apellido es requerido",
                    Alert.WARNING);
                return;
              }
              if (!clienteController.cliente.isValidTelefono()) {
                Alert.show("Campo Requerido", "El teléfono es requerido",
                    Alert.WARNING);
                return;
              }
              if (!clienteController.cliente.isValidDireccion()) {
                Alert.show("Campo Requerido", "La dirección es requerido",
                    Alert.WARNING);
                return;
              }
              if (!clienteController.cliente.isValidFechaNacimiento()) {
                Alert.show("Campo Requerido",
                    "La fecha de nacimiento es requerido", Alert.WARNING);
                return;
              }
              if (clienteController.cliente.isValidAdult()) {
                Alert.show("Aviso", "Cliente menor de edad", Alert.WARNING);
                return;
              }

              clienteController.save().then((value) {});
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
            label: "Documento",
            text: clienteController.cliente?.documento ?? '',
            errorText: clienteController.cliente.documentoError(),
            keyboardType: TextInputType.number,
            theme: theme,
            onSubmited: (value) {
              clienteController.findByDocumento().then((value) {});
            },
            onChanged: clienteController.cliente.setDocumento,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Nombre",
            text: clienteController.cliente?.nombre ?? '',
            errorText: clienteController.cliente.nombreError(),
            theme: theme,
            onChanged: clienteController.cliente.setNombre,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Apellido",
            text: clienteController.cliente?.apellido ?? '',
            errorText: clienteController.cliente.apellidoError(),
            theme: theme,
            onChanged: clienteController.cliente.setApellido,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Teléfono",
            text: clienteController.cliente?.telefono ?? '',
            keyboardType: TextInputType.phone,
            errorText: clienteController.cliente.telefonoError(),
            theme: theme,
            onChanged: clienteController.cliente.setTelefono,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          width: SizeUtils.widthScreen,
          height: SizeUtils.heightScreen,
          child: Text(
            'Sexo',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Observer(builder: (_) {
            print(clienteController.cliente.sexo);
            return DropdownButton(
              value: clienteController.cliente.sexo,
              elevation: 30,
              isExpanded: true,
              icon: Icon(Icons.person),
              dropdownColor: Colors.grey[100],
              iconEnabledColor: Color(0xFF052744),
              iconDisabledColor: Colors.black,
              items: [
                DropdownMenuItem(
                    child: Text(
                      "Masculino",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Masculino'),
                DropdownMenuItem(
                    child: Text(
                      "Femenino",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Femenino'),
              ],
              onChanged: clienteController.cliente.setSexo,
            );
          }),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          width: SizeUtils.widthScreen,
          height: SizeUtils.heightScreen,
          child: Text(
            'Estado Civil',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Observer(builder: (_) {
            print(clienteController.cliente.estadoCivil);
            return DropdownButton(
              value: clienteController.cliente.estadoCivil,
              elevation: 30,
              isExpanded: true,
              dropdownColor: Colors.grey[100],
              iconEnabledColor: Color(0xFF052744),
              iconDisabledColor: Colors.black,
              items: [
                DropdownMenuItem(
                    child: Text(
                      "Soltero",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Soltero'),
                DropdownMenuItem(
                    child: Text(
                      "Casado",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Casado'),
              ],
              onChanged: clienteController.cliente.setEstadoCivil,
            );
          }),
        ),
        Observer(
          builder: (_) => DateField(
            theme: theme,
            width: MediaQuery.of(context).size.width * 5,
            label: "Fecha de Nascimiento",
            date: clienteController.cliente?.fechaNacimiento ?? "",
            // errorText: clienteController.currentRecord.fechaNacimientoError(),
            selectedDate: clienteController.cliente.setDtNascimento,
          ),
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Dirección",
            text: clienteController.cliente?.direccion ?? '',
            theme: theme,
            errorText: clienteController.cliente.direccionError(),
            onChanged: clienteController.cliente.setDireccion,
          ),
        ),
      ],
    );
  }
}
