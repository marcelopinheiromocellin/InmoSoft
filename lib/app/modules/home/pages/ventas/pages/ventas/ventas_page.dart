import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/alert/alert.dart';
import 'package:inmo_soft/app/components/date_field/date_field.dart';
import 'package:inmo_soft/app/components/inputs/input_view/input_view.dart';
import 'package:inmo_soft/app/components/inputs/text_inputs/form_input.dart';
import 'package:inmo_soft/app/components/models/i_list_tile.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/pages/cliente/cliente_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/funcionario/funcionario_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/pages/lote/lote_controller.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/itens.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/ventas/ventas_controller.dart';
import 'package:inmo_soft/app/modules/home/widget/skeleton/skelaton_type.dart';
import 'package:inmo_soft/app/utils/size_utils.dart';
import 'package:intl/intl.dart';

import '../../../../../../app_controller.dart';

typedef ObjectValue = IListTile Function();

class VentasPage extends StatefulWidget {
  VentasPage({Key key}) : super(key: key);
  @override
  _VentasPageState createState() => _VentasPageState();
}

class _VentasPageState extends State<VentasPage> {
  final clienteController = Modular.get<ClienteController>();
  final funcionarioController = Modular.get<FuncionarioController>();
  final loteController = Modular.get<LoteController>();
  final ventasController = Modular.get<VentasController>();
  final theme = Modular.get<AppController>();
  ScrollController scrollController = ScrollController();

  final numberFormat = NumberFormat('###,###.##', 'es_PY');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Ventas',
              style: GoogleFonts.montserrat(),
            ),
          ),
          body: SingleChildScrollView(
            child: Observer(
              builder: (_) => Container(
                  padding: EdgeInsets.all(10),
                  child: (ventasController.processando
                      ? _loading(size)
                      : _body(size))),
            ),
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
          builder: (_) => InputView(
            label: 'Funcionario',
            skelatonType: SkelatonType.LIST_SKELATON_TYPE,
            errorText: ventasController.ventas.funcionarioError(),
            controller: funcionarioController,
            value: ventasController.ventas.funcionario?.nombre ?? '',
            result: (value) {
              ventasController.ventas.setFuncionario(value);
            },
            clean: () {
              ventasController.ventas.setFuncionario(null);
            },
          ),
        ),
        Observer(
          builder: (_) => InputView(
            label: 'Cliente',
            skelatonType: SkelatonType.LIST_SKELATON_TYPE,
            errorText: ventasController.ventas.clienteError(),
            controller: clienteController,
            value: ventasController.ventas.cliente?.nombre ?? '',
            result: (value) {
              ventasController.ventas.setCliente(value);
            },
            clean: () {
              ventasController.ventas.setCliente(null);
            },
          ),
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Observacón",
            text: ventasController.ventas?.obervacion ?? '',
            errorText: ventasController.ventas.obervacionError(),
            theme: theme,
            onSubmited: (value) {},
            onChanged: ventasController.ventas.setObervacion,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => DateField(
            theme: theme,
            width: MediaQuery.of(context).size.width * 5,
            label: "Fecha de Emisión",
            date: ventasController.ventas?.fechaEmision ?? "",
            selectedDate: ventasController.ventas.setFechaEmision,
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
            'Tipo de venta',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Observer(builder: (_) {
            print(ventasController.ventas.condicion);
            return DropdownButton(
              value: ventasController.ventas.condicion,
              elevation: 30,
              isExpanded: true,
              icon: Icon(Icons.shopping_cart),
              dropdownColor: Colors.grey[100],
              iconEnabledColor: Color.fromRGBO(28, 90, 92, 1),
              iconDisabledColor: Colors.black,
              items: [
                DropdownMenuItem(
                    child: Text(
                      "Contado",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Contado'),
                DropdownMenuItem(
                    child: Text(
                      "Credito",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                    value: 'Credito'),
              ],
              onChanged: ventasController.ventas.setTipoVenta,
            );
          }),
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
            'Estado del lote en la venta',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Observer(builder: (_) {
            print(ventasController.ventas.estado);
            return DropdownButton(
              value: ventasController.ventas.estado,
              elevation: 30,
              isExpanded: true,
              icon: Icon(Icons.subdirectory_arrow_left),
              dropdownColor: Colors.grey[100],
              iconEnabledColor: Color.fromRGBO(28, 90, 92, 1),
              iconDisabledColor: Colors.black,
              items: [
                DropdownMenuItem(
                  child: Text(
                    "Corriente",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                  ),
                  value: 'Corriente',
                ),
                DropdownMenuItem(
                  child: Text(
                    "Recuperado",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                    ),
                  ),
                  value: 'Recuperado',
                ),
              ],
              onChanged: ventasController.ventas.setEstado,
            );
          }),
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => InputView(
            label: 'Lote',
            skelatonType: SkelatonType.LIST_SKELATON_TYPE,
            controller: loteController,
            value: ventasController.listaItensSeleccionado?.lote?.nombre ?? '',
            result: (value) {
              ventasController.addLote(value);
            },
            clean: () {
              ventasController.addLote(null);
            },
          ),
        ),
        RaisedButton(
          color: Color.fromRGBO(28, 90, 92, 1),
          child: Container(
            decoration: BoxDecoration(),
            child: Text(
              'Adicionar item',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
            ),
          ),
          onPressed: () {
            ventasController.addLoteLista();
          },
        ),
        Container(
          color: Colors.grey[100],
          width: Get.width,
          height: Get.height * .5,
          child: Observer(builder: (_) {
            return ListView.builder(
              itemCount: ventasController.ventas.itens.length,
              itemBuilder: (_, int index) {
                Itens itens = ventasController.ventas.itens[index];
                return ListTile(
                  title: Text(
                    itens.lote.nombre,
                    style: GoogleFonts.montserrat(color: Colors.black),
                  ),
                  subtitle: Text(itens.lote.dimension),
                );
              },
            );
          }),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          width: Get.width,
          height: Get.height * .1,
          color: Colors.grey[100],
          child: Row(
            children: <Widget>[
              Text(
                'Total de la venta: ',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Color.fromRGBO(28, 90, 92, 1),
                ),
              ),
              Observer(
                builder: (context) => Text(
                  numberFormat.format(ventasController.ventas?.totalVenta ?? 0),
                  style:
                      GoogleFonts.montserrat(fontSize: 20, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: Get.width,
          height: Get.height * .1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  ventasController.removeItensLista();
                  Alert.show('Exito', 'Lista limpia!', Alert.SUCCESS);
                },
                color: Colors.red,
                child: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    'Limpiar',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              RaisedButton(
                color: Color.fromRGBO(28, 90, 92, 1),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    'Facturar',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  if (!ventasController.ventas.isValidFuncionario()) {
                    Alert.show("Atención", "El funcionario es requerido",
                        Alert.WARNING);
                    return;
                  }
                  if (!ventasController.ventas.isValidCliente()) {
                    Alert.show(
                        "Atención", "El cliente es requerido", Alert.WARNING);
                    return;
                  }
                  if (!ventasController.ventas.isValidObervacion()) {
                    Alert.show("Atención", "La observacion es requerido",
                        Alert.WARNING);
                    return;
                  }
                  if (!ventasController.ventas.isValidFechaEmision()) {
                    Alert.show("Atención", "La fecha de emisión es requerido",
                        Alert.WARNING);
                    return;
                  }
                  ventasController.save().then((value) {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
