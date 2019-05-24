import 'package:api_mvp/model/model.dart';
import 'package:api_mvp/presenter/presenter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  String title;

  MyHome({Key key, this.title});

  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> implements DataContract {
  DataListPresenter _presenter;
  List<MyModel> modelList;
  bool _isLoading = true;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _MyHomeState() {
    _presenter = new DataListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          elevation: debugDefaultTargetPlatformOverride == TargetPlatform.iOS
              ? 0.0
              : 5.0,
        ),
        body: _isLoading
            ? new Center(
                child: CircularProgressIndicator(),
              )
            : dataWidget());
  }

  Widget dataWidget() {
    return Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
                itemCount: modelList.length,
                itemBuilder: (BuildContext context, int index) {
                  final int i = index ~/ 2; //index bagi 2 dengan hasil pasti integer
                  final MyModel models = modelList[i];
                  final MaterialColor color = _colors[i % _colors.length];
                  if (index.isOdd) {
                    return new Divider();
                  }
                  return _listItem(models, color);
                }),
          )
        ],
      ),
    );
  }

  ListTile _listItem(MyModel model, MaterialColor color) {
    String imgUrl = "https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@d685b4cd3b9a91faab0541e5065c76fb616913ec/32@2x/icon/";
    return ListTile(
      leading: new Image.network(imgUrl +
          model.symbol.toLowerCase() +
          "@2x.png"),
      title: new Text(model.name,
          style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(model.price_usd, model.percent_change_1h),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String pr, String pc) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$pr\n",
        style: new TextStyle(color: Colors.black));

    String percentageChangeText = "1 hour: $pc%";


    TextSpan percentageChangeTextWidget;

    if (double.parse(pc) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }

  @override
  void onLoadDataComplete(List<MyModel> model) {
    setState(() {
      modelList = model;
      _isLoading = false;
    });
  }

  @override
  void onLoadDataError() {
    // TODO: implement onLoadDataError
  }
}
