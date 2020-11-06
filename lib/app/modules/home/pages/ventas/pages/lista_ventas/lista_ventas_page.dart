import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/utils/debouncer.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/models/ventas.dart';
import 'package:inmo_soft/app/modules/home/pages/ventas/pages/ventas/ventas_controller.dart';
import 'package:inmo_soft/app/modules/home/widget/skeleton/skelaton.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../app_controller.dart';
import 'lista_ventas_controller.dart';

class ListaVentasPage extends StatefulWidget {
  ListaVentasPage({Key key}) : super(key: key);

  @override
  _ListaVentasPageState createState() => _ListaVentasPageState();
}

class _ListaVentasPageState extends State<ListaVentasPage> {
  final controller = Modular.get<ListaVentaController>();
  final ventasController = Modular.get<VentasController>();
  final theme = Modular.get<AppController>();
  final TextEditingController _filter = TextEditingController();
  final Debouncer onSearchDebouncer =
      Debouncer(delay: new Duration(milliseconds: 500));
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  ScrollController scrollController = ScrollController();

  search() {
    controller.dataProvider = ObservableList();
    controller
        .findAll()
        .then((value) => FocusScope.of(context).requestFocus(new FocusNode()));
  }

  @override
  void initState() {
    controller.dataProvider = ObservableList();
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _filter.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromRGBO(28, 90, 92, 1),
        ),
        title: Container(
          height: 45,
          child: TextField(
            autofocus: false,
            controller: _filter,
            style: GoogleFonts.montserrat(
              color: Color.fromRGBO(28, 90, 92, 1),
            ),
            onSubmitted: (value) => search(),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(
                color: Color.fromRGBO(28, 90, 92, 1),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(28, 90, 92, 1),
                ),
                onPressed: () {
                  search();
                },
              ),
              suffixStyle: TextStyle(
                color: Color.fromRGBO(73, 163, 160, 1),
              ),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Color.fromRGBO(73, 163, 160, 1)),
        backgroundColor: Colors.white,
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          controller: scrollController,
          reverse: false,
          itemCount: controller.dataProvider.length,
          itemBuilder: (_, int index) {
            // return getListTile(value);
            return index >= controller.dataProvider.length
                ? Skelaton()
                : getListTile(controller.dataProvider[index]);
          },
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget getListTile(Ventas value) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            value.title,
            style:
                TextStyle(color: Color.fromRGBO(28, 90, 92, 1), fontSize: 20),
          ),
          subtitle: Text(
            value.subTitle,
            style:
                TextStyle(color: Color.fromRGBO(28, 90, 92, 1), fontSize: 15),
          ),
          dense: true,
        ),
      ),
      secondaryActions: slidable(value),
    );
  }

  List<Widget> slidable(Ventas value) {
    List<Widget> list = List();
    var editar = IconSlideAction(
      caption: 'Editar',
      color: Color.fromRGBO(28, 90, 92, 1),
      icon: Icons.mode_edit,
      foregroundColor: Colors.white,
      onTap: () {
        ventasController.currentRecordChange(value);
        Get.toNamed("/ventas/ventas");
      },
    );
    var cancelar = IconSlideAction(
      caption: 'Cancelar',
      color: Colors.red,
      icon: Icons.mode_edit,
      foregroundColor: Colors.white,
      onTap: () {
        _showConfirmacaoEliminar(context, value, controller);
      },
    );
    list.add(cancelar);
    list.add(editar);
    return list;
  }

  Future<void> _showConfirmacaoEliminar(
      BuildContext context, Ventas venta, ListaVentaController controller) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            width: Get.width,
            height: Get.height * .05,
            child: Row(
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                Text(
                  'Desseas cancelar?',
                  style: GoogleFonts.montserrat(color: Color(0xFF052744)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancelar',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF052744),
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Si',
                style: GoogleFonts.montserrat(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                controller
                    .cancelaVenta(venta.id)
                    .then((value) => Navigator.of(context).pop());
                search();
              },
            ),
          ],
        );
      },
    );
  }
}
