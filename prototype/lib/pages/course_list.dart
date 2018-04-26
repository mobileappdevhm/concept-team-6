import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/logic/category.dart';
import 'package:prototype/ui/factory/ui_factory.dart';
import 'package:prototype/ui/widgets/course_list_widget.dart';

class CourseList extends StatelessWidget {
  final Set<Category> selectedCategories;

  CourseList(this.selectedCategories);

  @override
  Widget build(BuildContext context) {
    return UIFactory.getAppScaffold(
        body: new CourseListWidget(
            filter: selectedCategories != null
                ? (course) {
                    if (selectedCategories.isNotEmpty) {
                      for (Category c in selectedCategories) {
                        if (c.faculties.contains(course.description.department)) {
                          return true;
                        }
                      }

                      return false;
                    }

                    return true;
                  }
                : null),
        context: context);
  }
}
