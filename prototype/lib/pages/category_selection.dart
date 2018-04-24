import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/ui/widgets/courses_widget.dart';
import 'package:prototype/ui/widgets/scenery_widget/scenery_widget.dart';
import 'package:prototype/ui/widgets/selection_drawer.dart';

class CategorySelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SceneryWrapperWidget(new SingleChildScrollView(
          child: new CoursesWidget(),
        )),
        drawer: new SelectionDrawer());
  }
}
