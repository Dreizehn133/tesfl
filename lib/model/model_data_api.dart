import 'package:api_mvp/model/model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:dio/dio.dart';
import 'retrofitApi.dart';



class ApiModelRepository implements MyModelRepository{
  String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  @override
  Future<List<MyModel>> fetchData() async{
    https.Response response = await https.get(url);
    print(response.body.toString());
    final List respBody =  json.decode(response.body.toString());

    final statusCodes = response.statusCode;
    if(statusCodes != 200 || respBody == null){
      throw new FetchDataException("Err with : Status : $statusCodes");
    }

    return respBody.map((c)=>new MyModel.fromMap(c)).toList();

//    final dio = Dio();
//    final client = ApiClient.obj(dio);
    List resp;
//    client.getData(50).then((i){
//      print(i);
//      dio.clear();
//      resp = json.decode(i.data.toString());
//
//
//    });
//    return resp.map((c)=>new MyModel.fromMap(c)).toList();

  }

}