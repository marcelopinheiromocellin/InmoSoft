import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/utils/debouncer.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/models/cliente.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/cliente/pages/cliente/cliente_controller.dart';
import 'package:inmo_soft/app/modules/home/widget/skeleton/skelaton.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../../app_controller.dart';
import 'lista_cliente_controller.dart';

class ListaClientePage extends StatefulWidget {
  const ListaClientePage({Key key}) : super(key: key);

  @override
  _ListaClientePageState createState() => _ListaClientePageState();
}

class _ListaClientePageState extends State<ListaClientePage> {
  final controller = Modular.get<ListaClienteController>();
  final clienteController = Modular.get<ClienteController>();
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
        .findByNombreAndApellido(_filter.text, _filter.text)
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
        leading: BackButton(color: Color(0xFF052744)),
        title: Container(
          height: 45,
          child: TextField(
            autofocus: false,
            controller: _filter,
            style: GoogleFonts.montserrat(color: Color(0xFF052744)),
            onSubmitted: (value) => search(),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: Color(0xFF052744)),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Color(0xFF052744),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(28, 90, 92, 1),
        onPressed: () {
          clienteController.currentRecordChange(Cliente());
          Get.toNamed("/registro/cliente/cliente");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        mini: true,
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget getListTile(Cliente value) {
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

  List<Widget> slidable(Cliente value) {
    List<Widget> list = List();
    var editar = IconSlideAction(
      caption: 'Editar',
      color: Color.fromRGBO(28, 90, 92, 1),
      icon: Icons.mode_edit,
      foregroundColor: Colors.white,
      onTap: () {
        clienteController.currentRecordChange(value);
        Get.toNamed("/registro/cliente/cliente");
      },
    );
    var eliminar = IconSlideAction(
      caption: 'Eliminar',
      color: Colors.red,
      icon: Icons.delete,
      foregroundColor: Colors.white,
      onTap: () {
        _showConfirmacaoEliminar(context, value, controller);
      },
    );
    list.add(editar);
    list.add(eliminar);
    return list;
  }

  Future<void> _showConfirmacaoEliminar(BuildContext context, Cliente cliente,
      ListaClienteController controller) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              SizedBox(width: 10),
              Text(
                'Desseas eliminar?',
                style: GoogleFonts.montserrat(color: Color(0xFF052744)),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancelar',
                style: GoogleFonts.montserrat(color: Color(0xFF052744)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Si',
                style: GoogleFonts.montserrat(color: Colors.red),
              ),
              onPressed: () {
                controller
                    .delete(cliente.id)
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
