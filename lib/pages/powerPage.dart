// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: unnecessary_new,
// ignore_for_file: prefer_const_constructors
// ignore_for_file:  file_names


import 'package:apptiendas/main.dart';
import 'package:flutter/material.dart';

class Power extends StatelessWidget {
  const Power({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(title: Text("Página Admin"),),
      body: new Column(
        children: <Widget>[
          Text("Estamos na página do adm"),
            ElevatedButton(
              child: Text("Sair"),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage(),));            
              },
            ),
        ],
      ),
    );
  }
}
