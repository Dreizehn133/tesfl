import 'package:api_mvp/model/model.dart';
import 'package:api_mvp/model/model_data_mock.dart';
import 'package:api_mvp/model/model_data_api.dart';

enum Flavor { MOCK, API }

//injection
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;
  static void config(Flavor flav){
    _flavor = flav;
  }
  factory Injector(){
    return _singleton;
  }
  Injector._internal();

  MyModelRepository get modelRepository {
    switch(_flavor){
      case Flavor.MOCK: return new MockModelRepository();
      default: return new ApiModelRepository();
    }
  }
}