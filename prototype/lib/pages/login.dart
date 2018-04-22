
import 'package:flutter/material.dart';
import 'package:prototype/ui/widgets/line_separator.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new Material(
      child: new Container(
      padding: new EdgeInsets.all(50.0),
      //child: new LineSeparator("blabla"),

      color: Colors.blue,
    )
    );
  }
}