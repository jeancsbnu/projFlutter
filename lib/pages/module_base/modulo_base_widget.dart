import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:treina_api_breeds/pages/racas/raca_page.dart';
import 'package:treina_api_breeds/shared/theme/theme_data.dart';

class ModuleBaseWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exercicio do treinamento",
      theme: ThemeDataApp().themeData,
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey
    );
  }

}