import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectionDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new DrawerHeader(
            decoration: new BoxDecoration(color: Colors.red),
            child: new Row(
              children: <Widget>[
                new Text("HomePage"),
                new Expanded(
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/HomePage");
                    },
                    child: new Icon(Icons.home),
                  ),
                ),
              ],
            ),
          ),
          new ListTile(
            title: new Text("CourseList"),
            onTap: () {
              Navigator.of(context).pushNamed("/CourseList");
            },
          ),
          new ListTile(
            title: new Text("FavouriteList"),
            onTap: () {
              Navigator.of(context).pushNamed("/FavouriteList");
            },
          )
        ],
      ),
    );
  }
}
