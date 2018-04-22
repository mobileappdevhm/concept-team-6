import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef void SelectListener(bool selected);

class TagWidget extends StatefulWidget {

  final List<SelectListener> _listeners = new List<SelectListener>();

  final String _text;
  final Color _color;

  TagWidget(this._text, this._color);

  void addListener(SelectListener listener) {
    _listeners.add(listener);
  }

  void removeListener(SelectListener listener) {
    _listeners.remove(listener);
  }


  @override
  State<StatefulWidget> createState() => new _TagWidgetState(_listeners, _text, _color);

}

class _TagWidgetState extends State<TagWidget> {

  final List<SelectListener> _listeners;

  bool _selected = false;
  final String _text;
  final Color _color;

  _TagWidgetState(this._listeners, this._text, this._color);

  void _notifyListeners() {
    for (SelectListener l in _listeners) {
      l.call(_selected);
    }
  }

  void _toggleSelected() {
    setState(() {
      _selected = !_selected;

      _notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new RaisedButton(
          child: new Text(_text),
          textColor: Colors.white,
          color: _color,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100000.0)),
          onPressed: _toggleSelected
      ),
      new CustomPaint(
        painter: new CheckBoxPainter(_selected)
      )
    ]);
  }

}

class CheckBoxPainter extends CustomPainter {

  bool _draw;

  CheckBoxPainter(this._draw);

  @override
  void paint(Canvas canvas, Size size) {
    if (_draw) {
      canvas.drawCircle(Offset.zero, 12.0, new Paint()..color = Colors.white);

      Paint border = new Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..color = Colors.black12;
      canvas.drawCircle(Offset.zero, 12.0, border);

      Paint checkPaint = new Paint()
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0;

      List<Offset> points = <Offset>[
        new Offset(-5.0, -2.0),
        new Offset(-1.0, 5.0),
        new Offset(7.0, -9.0)
      ];

      Path p = new Path();
      p.addPolygon(points, false);

      canvas.drawPath(p, checkPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}