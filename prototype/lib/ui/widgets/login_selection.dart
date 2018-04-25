import 'package:flutter/material.dart';
import 'package:prototype/pages/category_selection.dart';
import 'package:prototype/ui/widgets/line_separator.dart';

class LoginSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginSelectionState();
  }
}

class LoginSelectionState extends State<LoginSelection> {
  String enteredUsername = "";
  String enteredPassword = "";
  static const String SUFFIX = "@hm.edu";

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        inputFields(context),
        buttons(context),
      ],
    );
  }

  Column inputFields(BuildContext context) {
    FocusNode node = new FocusNode();
    return new Column(
      children: <Widget>[
        new Container(
          child: new Column(
            children: <Widget>[username(node, context), password(node)],
          ),
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        ),
      ],
    );
  }

  Expanded buttons(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          loginRow(context),
          lineSeperator(),
          guestRow(context)
        ],
      ),
    );
  }

  Container username(FocusNode node, BuildContext context) {
    TextEditingController controller = new TextEditingController();
    controller.addListener(() {
      enteredUsername = controller.text.toString();
    });
    return new Container(
      child: new TextFormField(
        maxLines: 1,
        maxLength: 20,
        decoration: new InputDecoration(
            labelText: "Input Username",
            icon: new Icon(Icons.person),
            suffixText: SUFFIX),
        controller: controller,
        onFieldSubmitted: (String value) {
          enteredUsername = value + SUFFIX;
          print(value);
          FocusScope.of(context).requestFocus(node);
        },
      ),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    );
  }

  Container password(FocusNode node) {
    TextEditingController controller = new TextEditingController();
    controller.addListener(() {
      enteredPassword = controller.text.toString();
    });
    return new Container(
      child: new TextFormField(
        maxLines: 1,
        controller: controller,
        maxLength: 30,
        decoration: new InputDecoration(
            labelText: "Input Password", icon: new Icon(Icons.vpn_key)),
        focusNode: node,
        obscureText: true,
        onFieldSubmitted: (String value) {
          enteredPassword = value;
        },
      ),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    );
  }

  Row loginRow(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
            child: new RaisedButton(
              onPressed: () {
                if (enteredPassword.length > 0 ||
                    enteredUsername.length > SUFFIX.length) {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CategorySelection()));
                } else {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text("Invalid Input!")));
                }
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(100000.0)),
              color: Colors.black,
              textColor: Colors.white,
              child: new Text("Login"),
            ),
            alignment: AlignmentDirectional.bottomCenter),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Container lineSeperator() {
    return new Container(
      child: new LineSeparator(title: "or"),
      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
    );
  }

  Row guestRow(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          child: new RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CategorySelection()));
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100000.0)),
            color: Colors.black,
            textColor: Colors.white,
            child: new Text("Continue as Guest"),
          ),
          alignment: AlignmentDirectional.topCenter,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  State<StatefulWidget> createState() {
    return new LoginSelectionState();
  }
}
