import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/utils/debouncer.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/models/lote.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/lote/pages/lote/lote_controller.dart';
import 'package:inmo_soft/app/modules/home/widget/skeleton/skelaton.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../../app_controller.dart';
import 'lista_lote_controller.dart';

class ListaLotePage extends StatefulWidget {
  ListaLotePage({Key key}) : super(key: key);

  @override
  _ListaLotePageState createState() => _ListaLotePageState();
}

class _ListaLotePageState extends State<ListaLotePage> {
  final controller = Modular.get<ListaLoteController>();
  final loteController = Modular.get<LoteController>();
  final theme = Modular.get<AppController>();
  final TextEditingController _filter = TextEditingController();
  final Debouncer onSearchDebouncer =
      Debouncer(delay: new Duration(milliseconds: 500));

  ScrollController scrollController = ScrollController();

  search() {
    controller.dataProvider = ObservableList();
    controller
        .findAll(_filter.text, _filter.text, _filter.text)
        .then((value) => FocusScope.of(context).requestFocus(new FocusNode()));
  }

  @override
  void initState() {
    controller.dataProvider = ObservableList();
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
                    color: Color(0xFF052744),
                  ),
                  onPressed: () {
                    search();
                  },
                ),
                suffixStyle: TextStyle(color: Color.fromRGBO(73, 163, 160, 1))),
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
          loteController.currentRecordChange(Lote());
          Get.toNamed("/registro/lote/lote");
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

  Widget getListTile(Lote value) {
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

  List<Widget> slidable(Lote value) {
    List<Widget> list = List();
    var editar = IconSlideAction(
      caption: 'Editar',
      color: Color.fromRGBO(28, 90, 92, 1),
      icon: Icons.mode_edit,
      foregroundColor: Colors.white,
      onTap: () {
        loteController.currentRecordChange(value);
        Get.toNamed("/registro/lote/lote");
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

  Future<void> _showConfirmacaoEliminar(
      BuildContext context, Lote lote, ListaLoteController controller) {
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
                    .delete(lote.id)
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
