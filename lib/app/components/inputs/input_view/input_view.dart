import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inmo_soft/app/components/controller/i_controller_base.dart';
import 'package:inmo_soft/app/components/models/i_tile.dart';

import 'data_search.dart';

typedef ObjectValue = Object Function(ITile);

class InputView extends StatefulWidget {
  final String label;
  final String value;
  final IControllerBase controller;
  final ObjectValue result;
  final Function clean;
  final String errorText;
  final int skelatonType;

  /*
  * é necesario passar o clean para ao clicar no botao limpar setar no controller null
   */

  const InputView(
      {Key key,
      @required this.label,
      @required this.controller,
      @required this.result,
      @required this.clean,
      this.value,
      this.errorText,
      this.skelatonType = 0})
      : super(key: key);

  @override
  _InputViewState createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  // String textValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 85,
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 55,
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: (widget.errorText == null
                                  ? Colors.grey[500]
                                  : Colors.red),
                              width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Colors.grey[50],
                          child: Text(
                            widget.label,
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 20,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  DataSearch(
                                    controller: widget.controller,
                                    skelaton: widget.skelatonType,
                                    onTap: (result) {
                                      setState(() {
                                        //  textValue = result.title;
                                      });
                                      widget.result(result);
                                    },
                                  ),
                                );

                                /*                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataSearch(
                                      controller: widget.controller,
                                      skelaton: widget.skelatonType,
                                      onTap: (result) {
                                        setState(() {
                                          //  textValue = result.title;
                                        });
                                        widget.result(result);
                                      },
                                    ),
                                  ),
                                ); */
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.clean();
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10)
                          ],
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 24,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              // textValue,
                              widget.value,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      (widget.errorText == null ? '' : widget.errorText),
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
