import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
//
class _HomeState extends State<Home> {

  String _result = "Result";
  TextEditingController _grausController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page"),
        backgroundColor: Colors.orangeAccent,
      ),
      //TODO: Como mudar o layout body e atualizar para que possa mudar o tipo de conta feita (ex: Calcular graus em radianos mudar para radianos em graus)
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _grausController,
                decoration: InputDecoration(
                    labelText: "Informe Grausº",
                    labelStyle: TextStyle(color: Colors.black)),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              padding:
              EdgeInsets.only(left: 2.0, top: 10.0, right: 2.0, bottom: 2.0),
            ),
            // TODO: Da uma ajuda aqui namoral (aliamento do result, onde colocar) RaisedButton
            Container(
                child: Padding(
                  child: RaisedButton(onPressed: () {
                    double _graus = double.parse(_grausController.text);
                    double _P = 180;
                    _calculate(_graus, _P, 2);
                  },
                      color: Colors.deepOrange,
                      child: Text("Calcular",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0
                        ),
                      )
                  ),
                  padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                )),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.deepOrangeAccent,
      //Menubar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Types of Counts"),
              decoration: BoxDecoration(color: Colors.orangeAccent),
            ),
            // TODO: Ver doc para descobrir como colocar items dentro de uma list, e colocar eles aqui / apenas colocar manualmente
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                //update
                //Fecha após o usuario escolher o que será selecionado, (passando contexto, O app karai)
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () {
                //update
              },
            )
          ],
        ),
      ),
    );
  }

  void _calculate(double _graus, double _P, int i) {
    double isFracaoG = _graus % 1.0;
    double isFracaoP = _P % 1.0;

    if (i != 9) {
      if (isFracaoG == 0.0 && isFracaoP == 0.0) {
        _graus = _graus / i;
        _P = _P / i;
        print("$i : Graus=> $_graus and P=> $_P  -- have");
        _calculate(_graus, _P, i);
      } else {
        print("$i : Graus=> $_graus and P=> $_P -- not have more ");
        _graus = _graus * i;
        _P = _P * i;
        i++;
        print("$i : Graus=> $_graus and P=> $_P -- go");
        _calculate(_graus, _P, i);
      }
    } else {
      print("PI: $_graus");
      print("graus: $_P");
      int a = _graus.floor();
      int b = _P.floor();
      setState(() {
        _result = a == 1 && b == 1 ? "π"
            : a == 1 && b != 1 ? "π / $b"
            : a != 1 && b == 1 ? "$aπ"
            : "$aπ / $b";
      });
    }
  }
}
