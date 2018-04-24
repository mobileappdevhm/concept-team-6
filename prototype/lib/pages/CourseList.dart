import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/ui/widgets/selection_drawer.dart';

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text(
                "Course1",
                style: new TextStyle(fontSize: 40.0),
              ),
            ),
            new ListTile(
              title: new Text(
                "Course2",
                style: new TextStyle(fontSize: 40.0),
              ),
            ),
            new ListTile(
              title: new Text(
                "Course3",
                style: new TextStyle(fontSize: 40.0),
              ),
            ),
            new ListTile(
              title: new Text(
                "Course4",
                style: new TextStyle(fontSize: 40.0),
              ),
            ),
          ],
        ),
        drawer: new SelectionDrawer());
  }
}
