import 'package:flutter/material.dart';
import 'package:prototype/pages/category_selection.dart';
import 'package:prototype/ui/widgets/line_separator.dart';
import 'package:prototype/ui/widgets/scenery_widget/scenery_widget.dart';
import 'package:prototype/ui/widgets/selection_drawer.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SceneryWrapperWidget(
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Einloggen"),
            new Container(child: new LineSeparator(title: "oder"), padding: new EdgeInsets.only(top: 20.0, bottom: 20.0)),
            new RaisedButton(
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new CategorySelection()));
                },
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100000.0)),
                color: Colors.black,
                textColor: Colors.white,
                child: new Text("Continue as Guest"))
          ],
        ),
      ),
      drawer: new SelectionDrawer(),
    );
  }
}
