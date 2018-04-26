import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/ui/factory/ui_factory.dart';
import 'package:prototype/ui/widgets/course_list_widget.dart';

class CourseList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return UIFactory.getAppScaffold(body: new CourseListWidget(),context: context);
  }

}
