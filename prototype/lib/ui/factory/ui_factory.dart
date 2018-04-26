import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:prototype/pages/course_list.dart';
import 'package:prototype/pages/favorites_list.dart';
import 'package:prototype/ui/widgets/scenery_widget/scenery_widget.dart';

class UIFactory {
  static Scaffold getAppScaffold({@required Widget body, BuildContext context}) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(
              "Courses in English",
              style: new TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
            ),
            centerTitle: true,
            flexibleSpace: new SceneryWidget(false)),
        body: body,
        //drawer: new SelectionDrawer(),
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(icon: new Icon(Icons.import_contacts), title: new Text("Courses")),
            new BottomNavigationBarItem(icon: new Icon(Icons.favorite_border), title: new Text("Favorites")),
            new BottomNavigationBarItem(icon: new Icon(Icons.event_note), title: new Text("Timetable"))
          ],
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            switch (index) {
              case (0):
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new CourseList(null)));
                break;
              case (1):
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new FavouriteList()));
                break;
              case (2):
                break;
              default:
            }
          },
        ));
  }
}
