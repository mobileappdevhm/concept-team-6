import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  static const Color DEFAULT_COLOR = const Color(0xFFDDDDDD);
  static const Color DEFAULT_TEXT_COLOR = const Color(0xFF707070);
  static const double DEFAULT_THICKNESS = 1.0;

  final String _title;
  final Color _color;
  final Color _textColor;
  final double _thickness;

  LineSeparator({String title, Color color = DEFAULT_COLOR, Color textColor = DEFAULT_TEXT_COLOR, double thickness = DEFAULT_THICKNESS})
      : _title = title,
        _color = color,
        _textColor = textColor,
        _thickness = thickness;

  @override
  build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextSpan span = new TextSpan(style: new TextStyle(color: _textColor, fontSize: 20.0, fontWeight: FontWeight.w300, letterSpacing: 3.0), text: _title);
    TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    tp.layout();

    return new Container(child: new CustomPaint(painter: new _LineSeparatorPainter(tp, _thickness, _color, _textColor)), height: tp.height, width: size.width);
  }
}

class _LineSeparatorPainter extends CustomPainter {
  TextPainter tp;
  Color _color;
  Color _textColor;
  double _thickness;

  _LineSeparatorPainter(this.tp, this._thickness, this._color, this._textColor);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    Paint paint = new Paint()..color = _color;

    double padding = rect.width * 0.05;
    double yOffset = rect.height / 2 - _thickness / 2;
    double insets = rect.width * 0.02;

    double textXOffset = rect.width / 2 - tp.width / 2;
    double textYOffset = rect.height / 2 - tp.height / 2;

    Rect leftRect = new Rect.fromPoints(new Offset(padding, yOffset), new Offset(textXOffset - insets, yOffset + _thickness));
    Rect rightRect = new Rect.fromPoints(new Offset(rect.width / 2 + tp.width / 2 + insets, yOffset), new Offset(rect.width - padding, yOffset + _thickness));

    canvas.drawRect(leftRect, paint);
    canvas.drawRect(rightRect, paint);

    tp.paint(canvas, new Offset(textXOffset, textYOffset));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
