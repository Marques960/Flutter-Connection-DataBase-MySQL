//ignorances
// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, body_might_complete_normally_nullable, use_key_in_widget_constructors, prefer_final_fields

//imports
import 'package:apptiendas/pages/powerPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerNivel = TextEditingController();

  var _formkey = GlobalKey<FormState>();

  void addData() {
    var url ="http://192.168.1.72:80/tienda/adddata.php";
    
    http.post(Uri.parse(url), body: {
      "username" : controllerUsername.text,
      "password": controllerPassword.text,
      "nivel": controllerNivel.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adiconar Utilizadores"),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget> [
                  //Utilizador
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.black,),
                    title: TextFormField(
                      controller: controllerUsername,
                      validator: (value) {
                        if(value!.isEmpty) return "Insira um utilizador";
                      },
                      decoration: InputDecoration(
                        hintText: "Utilizador",
                        labelText: "utilizador",
                      ),
                    ),
                  ),

                  //password
                  ListTile(
                    leading: Icon(Icons.password, color: Colors.black,),
                    title: TextFormField(
                      controller: controllerPassword,
                      validator: (value) {
                        if(value!.isEmpty) return "Insira uma password";
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                      ),
                    ),
                  ),

                  //nivel
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.black,),
                    title: TextFormField(
                      controller: controllerNivel,
                      validator: (value) {
                        if(value!.isEmpty) return "Insira um nivel";
                      },
                      decoration: InputDecoration(
                        hintText: "Nivel",
                        labelText: "Nivel",
                      ),
                    ),
                  ),
                  Divider(height: 1),
                  //guardar
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                    child: Text("Guardar"),
                    onPressed: () {
                      if(_formkey.currentState!.validate()) {
                        addData();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  //Sair
                   ElevatedButton(
                    child: Text("Sair"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Power()
                      ));
                    },
                  ),
                  ],
              ),
            ],
          ),
          ),
        
      ),
    );
  }
}