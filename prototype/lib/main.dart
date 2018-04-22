import 'package:flutter/material.dart';
import 'package:prototype/logic/DataFactory.dart';
import 'package:prototype/pages/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DataFactory.getDataProvider();
    return new LoginPage(

    );
  }
}
      