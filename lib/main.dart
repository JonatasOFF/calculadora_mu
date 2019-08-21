import 'package:flutter/material.dart';

import 'ScreenRforG.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Graus para Radianos"),
          backgroundColor: Colors.orangeAccent,
        ),
        //TODO: Fazer nova layout para escolher qual operação usar (graus for Rad, Rad for graus, Analise combinatoria(???) ISSO NUMA LISTA!
        //Codigo para abrir uma nova aba de layout

        //Navigator.push(context,
        //MaterialPageRoute(builder: (context) => newClass()));
        body: SingleChildScrollView(
          child: null,
        )
    );
  }
}