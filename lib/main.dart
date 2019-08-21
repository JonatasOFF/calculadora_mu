import 'package:flutter/material.dart';
//NÃO TO AQUI NÃO EM

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

  bool fracao = false;
  String Cima = "";
  String Baixo = "";
  TextEditingController _grausController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graus para Radianos"),
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
              padding: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 2.0),
            ),
            // TODO: Da uma ajuda aqui namoral (aliamento do result, onde colocar) RaisedButton
            Container(
                child: Padding(
              child: RaisedButton(
                  onPressed: () {
                    double _graus = double.parse(_grausController.text);
                    double _P = 180;
                    _calculate(_graus, _P, 2);
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
                  Cima,
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
                  Baixo,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              child: DrawerHeader(
                child: Text(
                  "Conversões",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
              ),
              height: 90,
            ),
            // TODO: Ver doc para descobrir como colocar items dentro de uma list, e colocar eles aqui / apenas colocar manualmente
            ListTile(
              title: Text("Graus para Radianos"),
              onTap: () {
                //update
                //Fecha após o usuario escolher o que será selecionado, (passando contexto, O app karai)
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Radianos para Graus"),
              onTap: () {
                //update
              },
            )
          ],
        ),
      ),
    );
  }

  //TODO: Verificar se possivel colocar method em o @override, ele será usado várias vezes de diferentes maneiras
  void _calculate(double _graus, double _P, int i) {
    //Utilizado para saber se o número que FOI dividido é decimal ou não
    double isFracaoG = _graus % 1.0;
    double isFracaoP = _P % 1.0;

    //Limit de 9, (kk pode colocar i <= 9 que é bem mais eficiente)
    if (i != 10) {
      //verifica se o número é decimal
      if (isFracaoG == 0.0 && isFracaoP == 0.0) {
        //dividi sabendo que o número NÂO é decimal
        _graus = _graus / i;
        _P = _P / i;
        //melhor observação do funcionamento
        print("$i : Graus=> $_graus and P=> $_P  -- have");

        _calculate(_graus, _P, i);

        //se a ultima vez que ele foi dividido deu número decimal
      } else {
        print("$i : Graus=> $_graus and P=> $_P -- not have more ");
        //então o methodo "desfaz" a divisão, e aumenta o divisor para que na proxima
        _graus = _graus * i;
        _P = _P * i;
        i++;
        print("$i : Graus=> $_graus and P=> $_P -- go");
        _calculate(_graus, _P, i);
      }
      //end
    } else {
      print("PI: $_graus");
      print("graus: $_P");
      int a = _graus.floor();
      int b = _P.floor();
      setState(() {
        Cima = a == 1 && b == 1
            ? "π"
            : a == 1 && b != 1 ? "π"
            : a != 1 && b == 1 ? "$aπ"
            : "$aπ";
        Baixo = a == 1 && b == 1
            ? ""
            : a == 1 && b != 1 ? "$b"
            : a != 1 && b == 1 ? ""
            : "$b";
        if(b != 1) {fracao = true;}
        else {fracao = false;}
      });
    }
  }
}
