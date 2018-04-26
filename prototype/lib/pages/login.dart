import 'package:flutter/material.dart';
import 'package:prototype/pages/category_selection.dart';
import 'package:prototype/ui/widgets/line_separator.dart';
import 'package:prototype/ui/widgets/login_selection.dart';
import 'package:prototype/ui/widgets/scenery_widget/scenery_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SceneryWrapperWidget(
        new LoginSelection(),

      ),
      resizeToAvoidBottomPadding: false,
    );
  }

}

/*Container titleRow() {
    return new Container(
      child: new Text(
        "Courses in English",
        style: new TextStyle(
            fontSize: 40.0, fontWeight: FontWeight.w700, color: Colors.grey),
      ),
      alignment: AlignmentDirectional.center,
      margin: EdgeInsets.symmetric(vertical: 20.0),
    );
  }*/
