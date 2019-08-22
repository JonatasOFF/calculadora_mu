import 'package:flutter/material.dart';

import 'ScreenGforR.dart';

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

  final List<String> _texts = [
    "Graus para Radiano",
    "Radiano para Graus",
    "nossa, isso é qualquer coisa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tela inicial"),
          backgroundColor: Colors.orangeAccent,
        ),

        body: ListView.builder(
          itemCount: _texts.length,
          itemBuilder: (BuildContext context, int index) {
            return RaisedButton(
              child: Row(
                children: <Widget>[
                  Padding(child: Text(_texts[index]),
                    padding: EdgeInsets.only(right: 10),
                  ),
                  //TODO: Colocar novos icones
                  //TODO: Animação do botão se quiser
                  Icon(Icons.access_alarms),
                ],
              ), onPressed: () {
              createActivity(index);
            },
            );
          },
        )
    );
  }

  void createActivity(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScreenGforR()));
        break;
      case 1:
        break;
      case 2:
        break;
      default:
    }
  }
}
