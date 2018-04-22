import 'package:flutter/material.dart';
import 'package:prototype/ui/widgets/line_separator.dart';
import 'package:prototype/ui/widgets/scenery_widget/scenery_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SceneryWrapperWidget(
        new Column(
          children: <Widget>[
            new Text("Einloggen"),
            new Container(child: new LineSeparator(title: "oder"), padding: new EdgeInsets.only(top: 20.0, bottom: 20.0)),
            new Text("Weiter als Gast")
          ]
        )
    );
  }
}
