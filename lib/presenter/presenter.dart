import 'package:api_mvp/model/model.dart';
import 'package:api_mvp/depedency_injection.dart';

abstract class DataContract{
  void onLoadDataComplete(List<MyModel> model);
  void onLoadDataError();
}

class DataListPresenter {
  DataContract _view;
  MyModelRepository _repo;

  DataListPresenter(this._view){
    _repo = new Injector().modelRepository;
  }

  void loadData(){
    _repo.fetchData()
        .then((c)=>_view.onLoadDataComplete(c))
        .catchError((er)=>_view.onLoadDataError());
  }


}