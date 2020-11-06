import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmo_soft/app/components/utils/debouncer.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/models/funcionario.dart';
import 'package:inmo_soft/app/modules/home/pages/registro/pages/funcionario/pages/funcionario/funcionario_controller.dart';
import 'package:inmo_soft/app/modules/home/widget/skeleton/skelaton.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../../app_controller.dart';
import 'lista_funcionario_controller.dart';

class ListaFuncionarioPage extends StatefulWidget {
  ListaFuncionarioPage({Key key}) : super(key: key);

  @override
  _ListaFuncionarioPageState createState() => _ListaFuncionarioPageState();
}

class _ListaFuncionarioPageState extends State<ListaFuncionarioPage> {
  final controller = Modular.get<ListaFuncionarioController>();
  final funcionarioController = Modular.get<FuncionarioController>();
  final theme = Modular.get<AppController>();
  final TextEditingController _filter = TextEditingController();
  final Debouncer onSearchDebouncer =
      Debouncer(delay: new Duration(milliseconds: 500));

  ScrollController scrollController = ScrollController();

  search() {
    controller.dataProvider = ObservableList();
    controller
        .findByNombre(_filter.text, _filter.text)
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
        leading: BackButton(color: Color.fromRGBO(28, 90, 92, 1)),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(28, 90, 92, 1),
        onPressed: () {
          funcionarioController.currentRecordChange(Funcionario());
          Get.toNamed("/registro/funcionario/funcionario");
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

  Widget getListTile(Funcionario value) {
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

  List<Widget> slidable(Funcionario value) {
    List<Widget> list = List();
    var editar = IconSlideAction(
      caption: 'Editar',
      color: Color.fromRGBO(28, 90, 92, 1),
      icon: Icons.mode_edit,
      foregroundColor: Colors.white,
      onTap: () {
        funcionarioController.currentRecordChange(value);
        Get.toNamed("/registro/funcionario/funcionario");
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

  Future<void> _showConfirmacaoEliminar(BuildContext context,
      Funcionario funcionario, ListaFuncionarioController controller) {
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
                style: GoogleFonts.montserrat(
                  color: Color.fromRGBO(28, 90, 92, 1),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancelar',
                style: GoogleFonts.montserrat(
                  color: Color.fromRGBO(28, 90, 92, 1),
                ),
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
                    .delete(funcionario.id)
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
