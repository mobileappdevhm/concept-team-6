import 'package:flutter/material.dart';
import 'package:prototype/pages/course_list.dart';
import 'package:prototype/pages/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Courses in English",
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        "/CourseList": (BuildContext context) => new CourseList(),
        "/HomePage" : (BuildContext context) => new LoginPage(),
      }

    );
  }
}
      