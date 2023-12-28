// ignore_for_file: unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apptiendas/pages/editData.dart';
import 'package:apptiendas/pages/listarutilizador.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({required this.index, required this.list});
  
  @override
  _DetailState createState() => _DetailState();
}


class _DetailState extends State<Detail> {
  //apagar dados
  void deleteData() {
    var url = "http://192.168.1.72:80/tienda/deleteData.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirmar() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          "Tens a certeza que pretendes apagar? '${widget.list[widget.index]['username']}'",
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text(
              "Eliminar",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              deleteData();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const ListarUtilizadores(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text(
              "Cancelar",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
  //showDialog(context: context, builder: alertDialog);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.list[widget.index]['username']}",
        ),
      ),
      body: Container(
        height: 270,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30)),
                Text(
                  widget.list[widget.index]['username'],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Divider(),
                Text(
                "Nivel: ${widget.list[widget.index]['nivel']}",
                style: TextStyle(
                  fontSize: 18,                  
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),

              Row(
                mainAxisSize: MainAxisSize.min,
                children:<Widget> [
                  ElevatedButton(
                    child: Text("Editar"),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditData(list: widget.list, index: widget.index),
                      )),
                  ),
                  VerticalDivider(),
                    ElevatedButton(
                      child: Text("Eliminar"),
                      onPressed: () => confirmar(),
                    ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
