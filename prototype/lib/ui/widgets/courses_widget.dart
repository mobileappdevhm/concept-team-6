import 'package:flutter/material.dart';
import 'package:prototype/logic/DataBaseInterface.dart';
import 'package:prototype/logic/DataFactory.dart';
import 'package:prototype/logic/category.dart';
import 'package:prototype/pages/course_list.dart';
import 'package:prototype/ui/widgets/tag_widget.dart';

class CoursesWidget extends StatefulWidget {
  @override
  CoursesWidgetState createState() => new CoursesWidgetState();
}

class CoursesWidgetState extends State<CoursesWidget> {
  String displayedString1 = "What are you";
  String boldString = "interested";
  String displayedString2 = "in?";

  List<TagWidget> tagWidgets = <TagWidget>[];

  Set<Category> selectedCategories = new Set<Category>();

  @override
  void initState() {
    super.initState();

    DataBaseInterface dataProvider = DataFactory.getDataProvider();

    dataProvider.getCategories().then((categories) {
      dataProvider.getFaculties().then((faculties) {
        tagWidgets.clear();

        for (Category c in categories) {
          TagWidget widget = new TagWidget(c.name, faculties[c.faculties[0]].color);

          widget.addListener((selected) {
            _onTagSelectionChanged(c, selected);
          });

          tagWidgets.add(widget);
        }

        setState(() {}); // Cause rebuild
      });
    });
  }

  void _onTagSelectionChanged(Category category, bool selected) {
    if (selected) {
      selectedCategories.add(category);
    } else {
      selectedCategories.remove(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    double vw = MediaQuery.of(context).size.width / 100;

    return new Container(
        padding: new EdgeInsets.only(top: vw * 10, bottom: vw * 10),
        child: new Center(
            child: new Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          new Column(children: <Widget>[
            new Text(displayedString1, style: new TextStyle(fontSize: 30.0)),
            new Text(boldString, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            new Text(displayedString2, style: new TextStyle(fontSize: 30.0))
          ]),
          new Container(
              child: new Wrap(children: tagWidgets, alignment: WrapAlignment.center, spacing: 10.0, runSpacing: 10.0), padding: new EdgeInsets.all(30.0)),
          new RaisedButton(
              child: new Text("Continue..."),
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100000.0)),
              color: const Color(0xFF333333),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new CourseList(selectedCategories)));
              })
        ])));
  }
}
