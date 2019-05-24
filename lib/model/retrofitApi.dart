import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:api_mvp/model/model.dart';
part 'retrofitApi.retrofit.dart';
//buat part format sprt di atas kemudian run -> flutter packages pub run build_runner build   https://api.coinmarketcap.com/v1/
@RestApi(baseUrl:"https://httpbin.org/")
abstract class ApiClient{

  static ApiClient obj(Dio dio) => _ApiClient(dio);

  @GET("ticker")
  Future<Response<String>> getData(@Query('limit') limit);

  @GET("/get")
  @Headers({
    "Header-One": " header 1",
  })
  Future<Response<String>> ip(@Query('query1') String query,
      {@QueryMap() Map<String, dynamic> queryies,
        @Header("Header-Two") String header});
}

