import 'package:flutter/material.dart';
import 'package:prototype/ui/widgets/availab_icon.dart';
import 'package:prototype/ui/widgets/heart_icon.dart';

class ListEntry extends StatefulWidget {
  String _courseName, _courseDescription;
  int _fkNumber;
  ListEntry(this._courseName, this._courseDescription, this._fkNumber);

  @override
  _ListEntryState createState() => new _ListEntryState(_courseName, _courseDescription, _fkNumber);
}

class _ListEntryState extends State {
  String _courseName, _courseDescription;
  int _fkNumber;

  _ListEntryState(this._courseName, this._courseDescription, this._fkNumber);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Text(
              _courseName,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: new TextStyle(
                fontSize: 13.0,
              ),
            ),
            // TODO: Obtain Availability status
            new AvailabilityIcon(Availability.green)
          ],
        ),
        new Row(
          children: <Widget>[
            new Text(
              _courseDescription,
              style: new TextStyle(
                fontSize: 11.0,
              ),
            ),
            // This container will be the empty space at the right of the description text
            // TODO: Is this necessary
            new Container()
          ],
        ),
        new Row(
          children: <Widget>[
            new Text("FK " + _fkNumber.toString(),
                style: new TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                )
            ),
            // For the space between faculty and heart icon
            new Expanded(
              child: new Container(),
            ),

            //TODO: Get marked state and pass it over
            new HeartIcon(true)

          ],
        )
      ],
    );
  }
}
