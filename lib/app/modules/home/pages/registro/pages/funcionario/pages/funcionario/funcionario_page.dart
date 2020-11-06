import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/app_controller.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/date_field/date_field.dart';
import 'package:inmo_soft/app/components/inputs/number_input/number_input_custom.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/form_input.dart';
import 'package:inmo_soft/app/utils/size_utils.dart';

import 'funcionario_controller.dart';

class FuncionarioPage extends StatefulWidget {
  FuncionarioPage({Key key}) : super(key: key);
  @override
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioPage> {
  final theme = Modular.get<AppController>();
  final funcionarioController = Modular.get<FuncionarioController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Registro de Funcionario',
              style: GoogleFonts.montserrat(),
            ),
          ),
          body: SingleChildScrollView(
            child: Observer(
              builder: (_) => Container(
                  padding: EdgeInsets.all(10),
                  child: (funcionarioController.processando
                      ? _loading(size)
                      : _body(size))),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(28, 90, 92, 1),
            onPressed: () {
              if (!funcionarioController.currentRecord.isValidDocumento()) {
                Alert.show("Campo Requerido", "El documento es requerido",
                    Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord.isValidNombre()) {
                Alert.show(
                    "Campo Requerido", "El nombre es requeridos", Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord.isValidApellido()) {
                Alert.show(
                    "Campo Requerido", "El apellido es requerido", Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord.isValidTelefono()) {
                Alert.show(
                    "Campo Requerido", "El teléfono es requerido", Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord.isValidSalario()) {
                Alert.show(
                    "Campo Requerido", "El salario es requerido", Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord.isValidSexo()) {
                Alert.show(
                    "Campo Requerido", "El sexo es requerido", Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord.isValidEstadoCivil()) {
                Alert.show("Campo Requerido", "El estado civil es requerido",
                    Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord.isValidCargo()) {
                Alert.show(
                    "Campo Requerido", "El cargo es requerido", Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord
                  .isValidFechaNacimientoError()) {
                Alert.show("Campo Requerido",
                    "La fecha de nacimiento es requerido", Alert.ERROR);
                return;
              }
              if (!funcionarioController.currentRecord
                  .isValidFechaIngresoError()) {
                Alert.show("Campo Requerido",
                    "La fecha de ingreso es requerido", Alert.ERROR);
                return;
              }

              if (funcionarioController.currentRecord.isValidAdult()) {
                Alert.show(
                    "Aviso", "Funcionarios menor de edad", Alert.WARNING);
                return;
              }
              funcionarioController.save().then((value) {});
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
            text: funcionarioController.currentRecord?.documento ?? '',
            errorText: funcionarioController.currentRecord.documentoError(),
            keyboardType: TextInputType.number,
            theme: theme,
            onSubmited: (value) {
              funcionarioController.findByDocumento().then((value) {});
            },
            onChanged: funcionarioController.currentRecord.setDocumento,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
              label: "Nombre",
              text: funcionarioController.currentRecord?.nombre ?? '',
              errorText: funcionarioController.currentRecord.nombreError(),
              theme: theme,
              onChanged: funcionarioController.currentRecord.setNombre),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Apellido",
            text: funcionarioController.currentRecord?.apellido ?? '',
            errorText: funcionarioController.currentRecord.apellidoError(),
            theme: theme,
            onChanged: funcionarioController.currentRecord.setApellido,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => DateField(
            theme: theme,
            width: MediaQuery.of(context).size.width * 5,
            label: "Fecha de Nascimiento",
            date: funcionarioController.currentRecord?.fechaNacimiento ?? '',
            selectedDate: funcionarioController.currentRecord.setDtNascimento,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => DateField(
            theme: theme,
            width: MediaQuery.of(context).size.width * 5,
            label: "Fecha de Ingreso",
            date: funcionarioController.currentRecord?.fechaIngreso ?? '',
            selectedDate: funcionarioController.currentRecord.setDtIngreso,
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
            print(funcionarioController.currentRecord.sexo);
            return DropdownButton(
              value: funcionarioController.currentRecord.sexo,
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
              onChanged:
                  funcionarioController.currentRecord?.setSexo ?? 'Masculino',
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
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Observer(builder: (_) {
            print(funcionarioController.currentRecord.estadoCivil);
            return DropdownButton(
              value: funcionarioController.currentRecord.estadoCivil,
              elevation: 30,
              isExpanded: true,
              dropdownColor: Colors.grey[100],
              iconEnabledColor: Color(0xFF052744),
              iconDisabledColor: Colors.black,
              items: [
                DropdownMenuItem(
                    child: Text(
                      "Soltero/a",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Soltero/a'),
                DropdownMenuItem(
                    child: Text(
                      'Casado/a',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Casado/a'),
              ],
              onChanged: funcionarioController.currentRecord?.setEstadoCivil ??
                  'Soltero/a',
            );
          }),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          width: SizeUtils.widthScreen,
          height: SizeUtils.heightScreen,
          child: Text(
            'Cargo',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Observer(builder: (_) {
            print(funcionarioController.currentRecord.cargo);
            return DropdownButton(
              value: funcionarioController.currentRecord.cargo,
              isExpanded: true,
              dropdownColor: Colors.grey[100],
              iconEnabledColor: Color(0xFF052744),
              iconDisabledColor: Colors.black,
              icon: Icon(Icons.work),
              items: [
                DropdownMenuItem(
                    child: Text(
                      'Cajero/a',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Cajero/a'),
                DropdownMenuItem(
                    child: Text(
                      "Vendedor/a",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Vendedor/a'),
              ],
              onChanged:
                  funcionarioController.currentRecord?.setCargo ?? 'Cajero/a',
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (context) => NumberInputCustom(
              themeData: ThemeData(),
              numberValue: funcionarioController.currentRecord?.salario ?? 0.0,
              fontColor: Colors.black87,
              labelText: 'Salario',
              onChanged: (value) {
                funcionarioController.currentRecord.salario = value;
              },
              errorText: funcionarioController.currentRecord.salarioError(),
            ),
          ),
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Teléfono",
            text: funcionarioController.currentRecord?.telefono ?? '',
            keyboardType: TextInputType.phone,
            errorText: funcionarioController.currentRecord.telefonoError(),
            theme: theme,
            onChanged: funcionarioController.currentRecord.setTelefono,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Dirección",
            text: funcionarioController.currentRecord?.direccion ?? '',
            theme: theme,
            errorText: funcionarioController.currentRecord.direccionError(),
            onChanged: funcionarioController.currentRecord.setDireccion,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
