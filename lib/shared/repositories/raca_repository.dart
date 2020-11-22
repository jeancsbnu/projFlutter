import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:treina_api_breeds/shared/models/response/raca_context_model_response.dart';

class RacaRepository{

  Future<RacaContextModelResponse> getRacaContextModel() async{
    final dio = Modular.get<Dio>();
    final String url = "https://dog.ceo/api/breeds/list";
    List<RacaContextModelResponse> lRaca = [];

    try{
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        return RacaContextModelResponse.fromJson(response.data);
      }
      return null;
    }catch(e){
      return Future.error(e);
    }
  }

}