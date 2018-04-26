import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/logic/Course.dart';
import 'package:prototype/logic/faculty.dart';
import 'package:prototype/ui/widgets/line_separator.dart';
import 'package:prototype/ui/widgets/tag_widget.dart';

typedef void FavListener(Course course,bool isFavorite);
typedef void SelectListener(bool isSelected);

class CourseDetailWidget extends StatefulWidget {
  final Course course;
  final Faculty faculty;
  final FavListener favListener;
  final SelectListener selectListener;
  final bool selected;
  final bool favorized;

  CourseDetailWidget(this.course, this.faculty, this.selected, this.favorized, this.favListener, this.selectListener);

  @override
  State<StatefulWidget> createState() => new _CourseDetailWidgetState(course, faculty, selected, favorized, favListener, selectListener);
}

class _CourseDetailWidgetState extends State<CourseDetailWidget> {
  static const Color HEART = const Color(0xFFFFA1A1);

  final Course course;
  final Faculty faculty;
  final FavListener favListener;
  final SelectListener selectListener;

  bool _selected = false;
  bool _favorized = false;

  _CourseDetailWidgetState(this.course, this.faculty, bool selected, bool favorized, this.favListener, this.selectListener)
      : _selected = selected,
        _favorized = favorized;

  @override
  Widget build(BuildContext context) {
    double vw = MediaQuery.of(context).size.width / 100;

    return new Column(children: <Widget>[
      new Row(children: <Widget>[
        new Expanded(
            child: new Column(children: <Widget>[
          new Align(
              child: new Container(
                  child: new Text(course.title, style: new TextStyle(fontWeight: FontWeight.w300, color: new Color(0xFF707070)), textScaleFactor: 1.6),
                  padding: new EdgeInsets.only(bottom: vw * 2)),
              alignment: Alignment.centerLeft),
          new Align(
              child: new Text("FK ${course.description.department}",
                  style: new TextStyle(fontWeight: FontWeight.bold, color: faculty != null ? faculty.color : Colors.grey), textScaleFactor: 1.3),
              alignment: Alignment.centerLeft)
        ])),
        new IconButton(
            icon: new Icon(_favorized ? Icons.favorite : Icons.favorite_border),
            color: HEART,
            iconSize: vw * 10,
            onPressed: () {
              _toggleFavorized();
            })
      ]),
      new Row(children: <Widget>[
        new Expanded(child: new Container(padding: new EdgeInsets.only(top: vw * 4, bottom: vw * 4), child: new LineSeparator(title: "Description")))
      ]),
      new Row(children: <Widget>[
        new Expanded(
            child: new Text(
          course.description.courseContent != null && !course.description.courseContent.isEmpty
              ? course.description.courseContent
              : "No description available. :(",
          style: new TextStyle(color: new Color(0xFF707070)),
          textScaleFactor: 1.2,
        ))
      ]),
      new Row(children: <Widget>[new Expanded(child: new Container(padding: new EdgeInsets.only(top: vw * 4, bottom: vw * 4), child: new LineSeparator()))]),
      new Center(
          child: new TagWidget("Select course", Colors.black)
            ..addListener((selected) {
              _toggleSelected();
            }))
    ]);
  }

  void _toggleFavorized() {
    setState(() {
      _favorized = !_favorized;
      favListener.call(this.course,_favorized);
    });
  }

  void _toggleSelected() {
    setState(() {
      _selected = !_selected;

      selectListener.call(_selected);
    });
  }
}
