//Ignorances
// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison, file_names, prefer_const_constructors
// ignore_for_file: unused_import
// ignore_for_file: avoid_print
// ignore_for_file:
// ignore_for_file:
// ignore_for_file:

//Imports
import 'package:apptiendas/pages/detail.dart';
import 'package:apptiendas/pages/registoUtilizadores.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//dart imports
import 'dart:async';
import 'dart:convert';

class ListarUtilizadores extends StatefulWidget {
  const ListarUtilizadores({super.key});

  @override
  _ListarUtilizadoresState createState() => _ListarUtilizadoresState();
}

class _ListarUtilizadoresState extends State<ListarUtilizadores> {
  Future<List> getData() async {
    final response =
        await http.get(Uri.parse("http://192.168.1.72:80/tienda/getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Utilizadores"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddData(),
            ),
          );
        },
      ),
      body: FutureBuilder<List<dynamic>?>(
        future: getData(),
        builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data ?? [],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

//lista dos utilizadores
class ItemList extends StatelessWidget {
  final List list;

  const ItemList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: Card(
              child: ListTile(
                title: Text(
                  list[i]['username'],
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.orangeAccent,
                  ),
                ),
                leading: const Icon(
                  Icons.person_pin,
                  size: 77.0,
                  color: Colors.orangeAccent,
                ),
                subtitle: Text(
                  "Nivel : ${list[i]['nivel']}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
