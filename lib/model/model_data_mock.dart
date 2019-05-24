import 'package:api_mvp/model/model.dart';
import 'dart:async';

class MockModelRepository implements MyModelRepository{
  @override
  Future<List<MyModel>> fetchData() {
    return new Future.value(dummy);
  }

}
//data dummy
var dummy = <MyModel>[
  new MyModel(name:"Data 1",price_usd:"8000",percent_change_1h:"-0.7",symbol:""),
  new MyModel(name:"Data 2",price_usd:"8000",percent_change_1h:"-0.7",symbol:""),
  new MyModel(name:"Data 3",price_usd:"8000",percent_change_1h:"-0.7",symbol:""),

];