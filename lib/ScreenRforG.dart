import 'package:flutter/material.dart';

class ScreenRforG extends StatelessWidget {
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
                    /**
                         * MUDAR URGENTEMENTE ESSA DROGA, OLHA ISSO MANO, ISSO TA MUITO DESORGANIZADO
                         */
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
                  "isso é um text",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
                /*Visibility(
                  visible: fracao,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 100,
                      height: 5,
                      color: Colors.black,
                    ),
                  ),
                ),*/
                Text(
                  "isso também é outro texto",
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
}
