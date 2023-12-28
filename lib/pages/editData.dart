// ignore_for_file: library_private_types_in_public_api, file_names, avoid_print, non_constant_identifier_names

import 'package:apptiendas/pages/listarutilizador.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  const EditData({super.key, required this.list, required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerUsername;
  late TextEditingController controllerPassword;
  late TextEditingController controllerNivel;

/*
  void EditData() {
    var url = "http://192.168.1.72:80/tienda/editdata.php";

    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "nivel": controllerNivel.text,
    });
  }
*/
Future<void> EditData() async {
  print("Sending HTTP request...");

  var url = "http://192.168.1.72:80/tienda/editdata.php";

  try {
    var response = await http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "nivel": controllerNivel.text,
    });

    // Check the request body
    print("Request Body: ${{
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "nivel": controllerNivel.text,
    }}");

    // Check the response status and body
    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    // Check if the data was updated successfully
    if (response.statusCode == 200) {
      print("Data updated successfully");
      // You can add additional logic here if needed
    } else {
      print("Failed to update data. Status code: ${response.statusCode}");
      // You can handle errors or display a message to the user
    }
  } catch (e) {
    print("Error: $e");
    // Handle network or other errors
  }
}





  @override
  void initState() {
    controllerUsername =
        TextEditingController(text: widget.list[widget.index]['username']);
    controllerPassword =
        TextEditingController(text: widget.list[widget.index]['password']);
    controllerNivel =
        TextEditingController(text: widget.list[widget.index]['nivel']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Column(
              children: <Widget>[
                //utilizador
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: TextFormField(
                    controller: controllerUsername,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduza um utilizador";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "utilizador",
                      labelText: "Utilizador",
                    ),
                  ),
                ),

                //password
                ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: TextFormField(
                    controller: controllerPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduza uma password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "password",
                      labelText: "password",
                    ),
                  ),
                ),

                //nivel
                ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: TextFormField(
                    controller: controllerNivel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Introduza uma nivel";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "nivel",
                      labelText: "nivel",
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  child: const Text("Guardar"),
                  onPressed: () {
                    print("Button Pressed"); 
                    EditData();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ListarUtilizadores()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
