import 'package:flutter/material.dart';

class CoursesWidget extends StatefulWidget {
	@override
	CoursesWidgetState createState() => new CoursesWidgetState();
}

class CoursesWidgetState extends State<CoursesWidget> {

	String displayedString1 = "What are you";
	String boldString = "interested";
	String displayedString2 = "in?";

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			//appBar: new AppBar(title: new Text("StatefulWidget"), backgroundColor: Colors.deepOrange),
			body: new Container(
				child: new Center(
					child: new Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							new Text(displayedString1, style: new TextStyle(fontSize: 30.0)),
							new Text(boldString, style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
							new Text(displayedString2, style: new TextStyle(fontSize: 30.0)),
							new Padding(padding: new EdgeInsets.all(10.0)),
							new ButtonBar(
								alignment: MainAxisAlignment.center, 
								mainAxisSize: MainAxisSize.min,
								children: [
									new RaisedButton(
										child: new Text("Computer Science"),
										textColor: Colors.white,
										color: const Color(0xFF00a0d2),
										onPressed: () {}

									),
									new RaisedButton(
										child: new Text("Mechatronics"),
										textColor: Colors.white,
										color: const Color(0xFF0188c8),
										onPressed: () {}
									)
								]
							),
							new ButtonBar(
								alignment: MainAxisAlignment.center,
								mainAxisSize: MainAxisSize.min,
								children: [
									new RaisedButton(
										child: new Text("Electronics"),
										textColor: Colors.white,
										color: const Color(0xFF00aab5),
										onPressed: () {}

									),
									new RaisedButton(
										child: new Text("Economy"),
										textColor: Colors.white,
										color: const Color(0xFF009b71),
										onPressed: () {}
									),
									new RaisedButton(
										child: new Text("Tourism"),
										textColor: Colors.white,
										color: const Color(0xFFa62a57),
										onPressed: () {}
									)
								]
							),
							new ButtonBar(
								alignment: MainAxisAlignment.center,
								mainAxisSize: MainAxisSize.min,
								children: [
									new RaisedButton(
										child: new Text("Design"),
										textColor: Colors.white,
										color: const Color(0xFF113b46),
										onPressed: () {}

									),
									new RaisedButton(
										child: new Text("Healthcare"),
										textColor: Colors.white,
										color: const Color(0xFFec7404),
										onPressed: () {}
									)
								]
							),
							new Padding(padding: new EdgeInsets.all(5.0)),
							new RaisedButton(
								child: new Text("Continue..."),
								textColor: Colors.white,
								color: const Color(0xFF333333),
								onPressed: () {} //new Page
							),
							new IconButton(
								icon: new Icon(Icons.favorite, color: Colors.red),
								tooltip: 'Checked Course'
							)
						]
					)
				)
			)
		);
	}
}