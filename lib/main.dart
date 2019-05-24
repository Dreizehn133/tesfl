import 'package:api_mvp/depedency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() async{
  Injector.config(Flavor.API);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: debugDefaultTargetPlatformOverride == TargetPlatform.iOS?Colors.grey[200]:null,
      ),
      home: MyHome(title: 'API with Learn MVP Ars'),
    );
  }
}


