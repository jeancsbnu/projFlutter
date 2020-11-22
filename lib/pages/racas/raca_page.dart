import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:treina_api_breeds/pages/racas/raca_controller.dart';

class RacaPage extends StatefulWidget {
  @override
  _RacaPageState createState() => _RacaPageState();
}

class _RacaPageState extends State<RacaPage> {
  final racaController = Modular.get<RacaController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    racaController.fetchOcurrencersResponseModeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Raças",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Observer(builder: (BuildContext context) {
          if (racaController.racaModel == null || racaController.racaModel.error != null) {
            return Center(
              child: RaisedButton(
                child: Text('Pressione novamente'),
                onPressed: () {
                  racaController.fetchOcurrencersResponseModeList();
                },
              ),
            );
          }
          if (racaController.racaModel.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var list = racaController.racaModel.value.message;

          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    list[index],
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                );
              });
        }));
  }
}
