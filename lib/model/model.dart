import 'dart:async';

class MyModel {
  String name;
  String price_usd;
  String percent_change_1h;
  String symbol;

  MyModel({this.name, this.price_usd, this.percent_change_1h,this.symbol});

  MyModel.fromMap(Map<String,dynamic> map):
  name=map['name'],
  price_usd=map['price_usd'],
  percent_change_1h=map['price_usd'],
  symbol=map['symbol']
  ;
}

abstract class MyModelRepository {
  Future<List<MyModel>> fetchData();
}

class FetchDataException implements Exception{
  final _message;

  FetchDataException([this._message]);

  String toStrings(){
    if(_message==null) return "Exception";
    return "Exception : $_message";
  }
}