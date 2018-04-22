import 'package:flutter/material.dart';

class AvailabilityIcon extends StatelessWidget{

  final Availability availab;
  AvailabilityIcon(this.availab);

  @override
  Widget build(BuildContext context){
    return new Row(
      children: <Widget>[
        new Text(
          availab.toString(),
          textAlign: TextAlign.right,
          style: new TextStyle(
            color: availab == Availability.green ? Colors.green : availab == Availability.yellow ? Colors.yellow : Colors.red,
            fontSize: 8.0
          ),

        ),
        //TODO: Add an icon with the color
        //new Icon();
      ],
    );
  }
}

enum Availability{green, yellow, red}