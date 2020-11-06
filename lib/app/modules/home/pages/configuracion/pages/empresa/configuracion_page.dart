import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/form_input.dart';
import '../../../../../../app_controller.dart';
import 'configuracion_controller.dart';

class ConfiguracionPage extends StatefulWidget {
  ConfiguracionPage({Key key}) : super(key: key);

  @override
  _ConfiguracionPageState createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  final theme = Modular.get<AppController>();
  final ConfiguracionController loteController = Modular.get();

  @override
  void initState() {
    loteController.findById();
    super.initState();
  }

  String foto;
//Seleccionar la foto
  Future<void> showCameraBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Tomar Fotografia",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  GestureDetector(
                    child: Text("Seleccionar de la Galeria",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    onTap: () {
                      openGalery();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  GestureDetector(
                    child: Text("Cerrar",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  openCamera() {
    ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 480,
      maxWidth: 640,
    ).then((value) async {
      List fileBytes = value.readAsBytesSync();
      String encodedFile = base64.encode(fileBytes);
      // loteController.usuario.setFoto(encodedFile);
      setState(() {
        foto = encodedFile;
      });
    });
    Navigator.of(context).pop();
  }

  openGalery() {
    ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 480,
      maxWidth: 640,
    ).then((value) async {
      List fileBytes = value.readAsBytesSync();
      String encodedFile = base64.encode(fileBytes);
      // loteController.usuario.setFoto(encodedFile);
      setState(() {
        foto = encodedFile;
      });
    });
    Navigator.of(context).pop();
  }

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
    final size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Empresa',
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
              if (!loteController.currentRecord.isValidNombre()) {
                Alert.show(
                    "Campo Requerido", "Nombre es requerido", Alert.ERROR);
                return;
              }
              if (!loteController.currentRecord.isValidRuc()) {
                Alert.show("Campo Requerido", "Ruc es requerido", Alert.ERROR);
                return;
              }
              if (!loteController.currentRecord.isValidTelefono()) {
                Alert.show(
                    "Campo Requerido", "Teléfono es requerido", Alert.ERROR);
                return;
              }
              loteController.save().then((value) {});
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
        // GestureDetector(
        //   child: getFoto(),
        //   onTap: () {
        //     showCameraBox();
        //   },
        // ),
        Observer(
          builder: (_) => FormInput(
            label: "Nombre",
            text: loteController.currentRecord?.nombre ?? '',
            errorText: loteController.currentRecord.nombreError(),
            theme: theme,
            onChanged: loteController.currentRecord.setNombre,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Teléfono",
            text: loteController.currentRecord?.telefono ?? '',
            errorText: loteController.currentRecord.telefonoError(),
            theme: theme,
            keyboardType: TextInputType.phone,
            onChanged: loteController.currentRecord.setTelefono,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Ruc",
            text: loteController.currentRecord?.ruc ?? '',
            errorText: loteController.currentRecord.rucError(),
            theme: theme,
            keyboardType: TextInputType.phone,
            onChanged: loteController.currentRecord.setRuc,
          ),
        ),
      ],
    );
  }
}
