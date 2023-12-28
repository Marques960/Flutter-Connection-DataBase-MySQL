// ignore_for_file: prefer_const_literals_to_create_immutables, unused_import
// ignore_for_file: unnecessary_new,
// ignore_for_file: prefer_const_constructors
// ignore_for_file:  file_names


import 'package:apptiendas/main.dart';
import 'package:apptiendas/pages/listarutilizador.dart';
import 'package:flutter/material.dart';

class Power extends StatelessWidget {
  const Power({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(title: Text("Página Admin"),),
      body: new Column(
        children: <Widget>[
          Row(
            //Row1
            children: <Widget>[
              //Listar Utilizadores
              Container(
                padding: EdgeInsets.all(2),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) => ListarUtilizadores(),
                    ));
                  },
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.people,
                    color: Colors.black,
                    size:65,
                  ),
                ),
              ),
              //----
              Container(
                padding: EdgeInsets.all(2),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) => ListarUtilizadores(),
                    ));
                  },
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.black,
                    size:65,
                  ),
                ),
              ),
              //--------          
            ],
          ),

          Row(
            //Row2
            children: <Widget>[
              //Listar Utilizadores
              Container(
                padding: EdgeInsets.all(2),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) => ListarUtilizadores(),
                    ));
                  },
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.people,
                    color: Colors.black,
                    size:65,
                  ),
                ),
              ),
              //----
              Container(
                padding: EdgeInsets.all(2),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) => ListarUtilizadores(),
                    ));
                  },
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.black,
                    size:65,
                  ),
                ),
              ),
              //--------          
            ],
          ),

          Row(
            //Row3
            children: <Widget>[
              //Listar Utilizadores
              Container(
                padding: EdgeInsets.all(2),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) => ListarUtilizadores(),
                    ));
                  },
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.people,
                    color: Colors.black,
                    size:65,
                  ),
                ),
              ),
              //----
              Container(
                padding: EdgeInsets.all(2),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) => LoginPage(),
                    ));
                  },
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                    size:65,
                  ),
                ),
              ),
              //--------          
            ],
          ),
        ],
      ),
    );
  }
}
