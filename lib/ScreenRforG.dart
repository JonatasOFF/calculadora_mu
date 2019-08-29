import 'package:flutter/material.dart';

import 'Calculate.dart';

class ScreenRforG extends StatefulWidget {
  @override
  _ScreenRforGState createState() => _ScreenRforGState();
}

class _ScreenRforGState extends State<ScreenRforG> implements Calculate {
  TextEditingController _pi = TextEditingController();
  TextEditingController _divisor = TextEditingController();
  String _result = "Result";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Radianos para Graus"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _pi,
                decoration: InputDecoration(
                    labelText: "π",
                    labelStyle: TextStyle(color: Colors.black)),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 2.0),
            ),
            Padding(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _divisor,
                decoration: InputDecoration(
                    labelText: "Divisor",
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
                      onPressed: calculate,
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
                  _result,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  @override
  void calculate({double graus, double P, int i}) {
    double pi = double.parse(_pi.text);
    double divisor = double.parse(_divisor.text);

    setState(() {
      double result = (pi * 180) / divisor;
      _result = "$resultº";
    });
  }

}
