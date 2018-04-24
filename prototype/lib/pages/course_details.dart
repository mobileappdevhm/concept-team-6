import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:prototype/logic/Course.dart';
import 'package:prototype/ui/widgets/selection_drawer.dart';

class CourseDetails extends StatelessWidget {

  final Course course;

  CourseDetails({
    @required Course course
  }) : this.course = course;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      child: new Text(
                        "CourseDetail",
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 40.0),
                      ),
                      alignment: AlignmentDirectional.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: new SelectionDrawer());
  }
}
