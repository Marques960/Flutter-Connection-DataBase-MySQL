// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: unused_local_variable
// ignore_for_file: use_build_context_synchronously
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_new
// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'package:apptiendas/pages/powerPage.dart';
import 'package:apptiendas/pages/vendedoresPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(const LoginApp());

String username = "";

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter + Mysql",
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        '/powerPage': (BuildContext context) => const Power(),
        '/vendedoresPage': (BuildContext context) => const Vendedores(),
        'LoginPage': (BuildContext context) => const LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPagetState();
}

class _LoginPagetState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String message = "";

  Future<String> login() async {
 
    final response = await http.post("http://localhost/tienda/login.php", body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        message = "utilizador ou senha incorreta";
      });
    } else {
      if (datauser[0]['nivel'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/powerPage');
      } else if (datauser[0]['nivel'] == 'ventas') {
        Navigator.pushReplacementNamed(context, '/vendedoresPage');
      }
      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 77.0),
              width: 170.0,
              height: 170.0,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Image(
                  width: 135,
                  height: 135,
                  image: AssetImage("assets/images/img2.png"),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                top: 93,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 16,
                      right: 16,
                      bottom: 4,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ]),
                    child: TextFormField(
                      controller: controllerUser,
                      decoration: InputDecoration(
                        hintText: "User",
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 2,
                      left: 16,
                      right: 16,
                      bottom: 4,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ]),
                    child: TextFormField(
                      controller: controllerPass,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6, right: 32),
                      child: Text(
                        "Remenber Password",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      login();
                      Navigator.pop(context);
                    },
                    child: Text("Sign In"),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
