import 'package:flutter/material.dart';

import 'Calculate.dart';

class ScreenGforR extends StatefulWidget {
  @override
  _ScreenGforRState createState() => _ScreenGforRState();
}

class _ScreenGforRState extends State<ScreenGforR> implements Calculate {
  bool fracao = false;
  String _cima = "";
  String _baixo = "";

  // ignore: non_constant_identifier_names
  double PI_GRAUS = 180;
  TextEditingController _grausController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graus para Radianos"),
        backgroundColor: Colors.orangeAccent,
      ),
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
              padding: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 2.0),
            ),
            Container(
                child: Padding(
              child: RaisedButton(
                  onPressed: () {
                    try {
                      calculate(
                          graus: double.parse(_grausController.text),
                          P: PI_GRAUS,
                          i: 2);
                    } catch (Exception) {
                      print(
                          "Cola essa droga aqui no negocio e muda tudo caso essa mensagem apareça"
                          "double _P = 180; \n "
                          "double _graus = double.parse(_grausController.text);");
                    }
                  },
                  color: Colors.orangeAccent,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  )),
              padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
            )),
            Column(
              children: <Widget>[
                Text(
                  _cima,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
                Visibility(
                  visible: fracao,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 100,
                      height: 5,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  _baixo,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      //Menubar
//      drawer: Drawer(
//        child: ListView(
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            SizedBox(
//              child: DrawerHeader(
//                child: Text(
//                  "Conversões",
//                  style: TextStyle(
//                    fontSize: 20,
//                  ),
//                ),
//                decoration: BoxDecoration(
//                  color: Colors.orangeAccent,
//                ),
//              ),
//              height: 90,
//            ),
//            ListTile(
//              title: Text("Graus para Radianos"),
//              onTap: () {
//                //update
//                //Fecha após o usuario escolher o que será selecionado, (passando contexto, O app karai)
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text("Radianos para Graus"),
//              onTap: () {
//                //update
//              },
//            )
//          ],
//        ),
//      ),
    );
  }

  @override
  void calculate({double graus, double P, int i}) {
    // TODO: implement calculate
    //Utilizado para saber se o número que FOI dividido é decimal ou não
    double isFracaoG = graus % 1.0;
    double isFracaoP = P % 1.0;

    if (i <= 9) {
      //verifica se o número é decimal
      if (isFracaoG == 0.0 && isFracaoP == 0.0) {
        //dividi sabendo que o número NÂO é decimal
        graus = graus / i;
        P = P / i;
        //melhor observação do funcionamento
        print("$i : Graus=> $graus and P=> $P  -- have");

        calculate(graus: graus, P: P, i: i);

        //se a ultima vez que ele foi dividido deu número decimal
      } else {
        print("$i : Graus=> $graus and P=> $P -- not have more ");
        //então o methodo "desfaz" a divisão, e aumenta o divisor para que na proxima
        graus = graus * i;
        P = P * i;
        i++;
        print("$i : Graus=> $graus and P=> $P -- go");
        calculate(graus: graus, P: P, i: i);
      }
      //end
    } else {
      print("PI: $graus");
      print("graus: $P");
      int a = graus.floor();
      int b = P.floor();
      setState(() {
        _cima = a == 1 && b == 1
            ? "π"
            : a == 1 && b != 1 ? "π" : a != 1 && b == 1 ? "$aπ" : "$aπ";
        _baixo = a == 1 && b == 1
            ? ""
            : a == 1 && b != 1 ? "$b" : a != 1 && b == 1 ? "" : "$b";
        if (b != 1) {
          fracao = true;
        } else {
          fracao = false;
        }
        PI_GRAUS = 180;
      });
    }
  }
}
