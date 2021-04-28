import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=2a19e004";

void main() async {

  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _realController = TextEditingController();
  final _dolarController = TextEditingController();
  final _euroController = TextEditingController();

  double dolar;
  double euro;

  void _realChanged(String text){
    double real = double.parse(text);
    _dolarController.text = (real/dolar).toStringAsPrecision(2);
    _euroController.text = (real/euro).toStringAsPrecision(2);
  }
  void _dolarChanged(String text){
    double dolar = double.parse(text);
    _realController.text = (dolar * this.dolar).toStringAsPrecision(2);
    _euroController.text = (dolar * this.dolar/euro).toStringAsPrecision(2);
  }
  void _euroChanged(String text){
    double euro = double.parse(text);
    _realController.text = (euro * this.euro).toStringAsPrecision(2);
    _dolarController.text = (euro * this.euro / dolar).toStringAsPrecision(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Convesor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snaphost){
          switch(snaphost.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text("Carregando dados...", style: TextStyle(color: Colors.amber, fontSize: 25.0), textAlign: TextAlign.center,),
              );
            default:
              if(snaphost.hasError){
                return Center(
                  child: Text("Erro ao carregar os dados :(", style: TextStyle(color: Colors.amber, fontSize: 25.0), textAlign: TextAlign.center,),
                );
              }else{
                dolar = snaphost.data["results"]["currencies"]["USD"]["buy"];
                euro = snaphost.data["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Icon(Icons.monetization_on, size: 150.0, color: Colors.amber,),
                      buildTextField("Reais", "R\$", _realController, _realChanged),
                      Divider(),
                      buildTextField("Dolares", "US\$", _dolarController, _dolarChanged),
                      Divider(),
                      buildTextField("Euros", "€", _euroController, _euroChanged),
                    ],
                  ),
                );
              }
          }
        }
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c, Function f){
  return TextField(
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix,
    ),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
    controller: c,
    onChanged: f,
    keyboardType: TextInputType.number,
  );
}