import 'package:flutter/material.dart';
import 'package:inmo_soft/app/components/controller/i_controller_base.dart';
import 'package:inmo_soft/app/components/models/i_simple_list_tile.dart';
import 'package:inmo_soft/app/components/models/i_tile.dart';
import 'package:inmo_soft/app/modules/home/widget/skeleton/skelaton.dart';

import '../../models/i_list_tile.dart';

typedef ObjectValue = Object Function(ITile);

class DataSearch extends StatefulWidget {
  const DataSearch({Key key, this.controller, this.onTap, this.skelaton = 0})
      : super(key: key);

  @override
  _DataSearchState createState() => _DataSearchState();
  final IControllerBase controller;
  final ObjectValue onTap;
  final int skelaton;
}

class _DataSearchState extends State<DataSearch> {
  final TextEditingController _filter = new TextEditingController();
  List data = List();
  bool consultando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 45,
          child: TextField(
            autofocus: true,
            controller: _filter,
            decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                labelStyle: TextStyle(color: Color.fromRGBO(73, 163, 160, 1)),
                suffixIcon: GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () {
                    setState(() {
                      consultando = true;
                    });

                    widget.controller
                        .findByCondition(_filter.text)
                        .then((value) {
                      setState(() {
                        if (value != null) {
                          data = value;
                        } else {
                          Navigator.of(context).pop();
                        }

                        consultando = false;
                      });
                    }).catchError((error) {
                      setState(() {
                        consultando = false;
                      });
                    });
                  },
                ),
                suffixStyle: TextStyle(color: Color.fromRGBO(73, 163, 160, 1))),
          ),
        ),
        iconTheme: IconThemeData(color: Color.fromRGBO(73, 163, 160, 1)),
        backgroundColor: Colors.white,
      ),
      body: (consultando ? loading() : list()),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget list() {
    return Container(
      child: ListView.builder(
          reverse: false,
          itemCount: data.length,
          itemBuilder: (_, int index) {
            var value = data[index];
            if (value is IListTile) {
              return getListTile(value);
            }
            if (value is ISimpleListTile) {
              return getSimpleListTile(value);
            }
            return Text(
                'EL COMPONENTE NO IMPLEMENTA IListTile o SimpleListTile');
          }),
    );
  }

  Widget loading() {
    if (widget.skelaton == 0) {
      return Center(
        child: CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(73, 163, 160, 1)),
      );
    } else if (widget.skelaton == 1) {
      return Skelaton();
    } else if (widget.skelaton == 2) {
      return Skelaton();
    }
    return null;
  }

  Widget getListTile(IListTile value) {
    return ListTile(
      onTap: () {
        this.widget.onTap(value);
        Navigator.of(context).pop();
      },
      title: Text(value.title),
      subtitle: Text(value.subTitle),
    );
  }

  Widget getSimpleListTile(ISimpleListTile value) {
    return ListTile(
      onTap: () {
        this.widget.onTap(value);
        Navigator.of(context).pop();
      },
      title: Text(value.title),
    );
  }
}
