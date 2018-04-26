import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/logic/Course.dart';
import 'package:prototype/logic/DataFactory.dart';
import 'package:prototype/logic/faculty.dart';
import 'package:prototype/pages/course_details.dart';
import 'package:prototype/ui/widgets/course_list_entry.dart';

typedef bool Filter(Course course);

class CourseListWidget extends StatefulWidget {
  final Filter filter;

  CourseListWidget({Filter filter}) : this.filter = filter;

  @override
  State<StatefulWidget> createState() => new _CourseListWidgetState(filter);
}

class _CourseListWidgetState extends State<CourseListWidget> {
  final Filter filter;

  List<CourseListEntry> entries;

  _CourseListWidgetState(this.filter) {
    DataFactory.getDataProvider().getCourses().then((courses) {
      DataFactory.getDataProvider().getFaculties().then((faculties) {
        setState(() {
          entries = new List<CourseListEntry>();

          for (Course c in courses) {
            bool accept = true;
            if (filter != null) {
              accept = filter.call(c);
            }

            if (accept) {
              entries.add(new CourseListEntry(c, faculties[c.description.department], (isFavorite) {
                onFavorized(c, isFavorite);
              }, () {
                onEntryTap(c, faculties[c.description.department]);
              }));
            }
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (entries != null) {
      return new ListView(children: entries);
    } else {
      return new Center(child: new Text("Loading..."));
    }
  }

  void onFavorized(Course course, bool isFavorite) {
    print("${course.title} has been ${isFavorite ? "favorized" : "unfavorized"}!");
    DataFactory.getDataProvider().setFavourite(course, isFavorite);
    course.favourite = isFavorite;
  }

  void onEntryTap(Course course, Faculty faculty) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new CourseDetails(course, faculty)));
  }
}
