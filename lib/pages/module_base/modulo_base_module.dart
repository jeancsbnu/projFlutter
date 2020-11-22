import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:treina_api_breeds/pages/module_base/modulo_base_widget.dart';
import 'package:treina_api_breeds/pages/racas/raca_controller.dart';
import 'package:treina_api_breeds/pages/racas/raca_page.dart';
import 'package:treina_api_breeds/shared/repositories/raca_repository.dart';

class ModuleBaseModule extends MainModule{
  @override
  List<Bind> get binds => [
    //Dio
    Bind((i) => Dio(BaseOptions(baseUrl: ""))),
    //Controller
    Bind((i) => RacaController()),
    //Repository
    Bind((i) => RacaRepository()),
  ];

  @override
  Widget get bootstrap => ModuleBaseWidget();

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child:(_,arg) => RacaPage())
  ];

}