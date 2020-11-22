import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:treina_api_breeds/shared/models/response/raca_context_model_response.dart';
import 'package:treina_api_breeds/shared/repositories/raca_repository.dart';

part 'raca_controller.g.dart';

class RacaController = _RacaControllerBase with _$RacaController;

abstract class _RacaControllerBase with Store{
  final RacaRepository repository = Modular.get<RacaRepository>();

  @observable
  ObservableFuture<RacaContextModelResponse> racaModel;

  @action
  void fetchOcurrencersResponseModeList(){
    racaModel = repository.getRacaContextModel().asObservable();
  }

}
