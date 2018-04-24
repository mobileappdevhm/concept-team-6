import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/logic/Course.dart';
import 'package:prototype/logic/faculty.dart';
import 'package:prototype/ui/factory/ui_factory.dart';
import 'package:prototype/ui/widgets/course_detail_widget.dart';

class CourseDetails extends StatelessWidget {
  final Course course;
  final Faculty faculty;

  CourseDetails(this.course, this.faculty);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double vw = size.width / 100;

    return UIFactory.getAppScaffold(
        body: new SingleChildScrollView(
            child: new CourseDetailWidget(course, faculty, false, false, (isFavorized) {
              print("Favorized $isFavorized");
            }, (isSelected) {
              print("Selected: $isSelected");
            }),
            padding: EdgeInsets.all(vw * 5)));
  }
}
