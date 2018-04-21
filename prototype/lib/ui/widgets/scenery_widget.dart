import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class SceneryWrapper extends StatelessWidget {

  Widget _child;

  SceneryWrapper(this._child);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Column(
      children: <Widget>[
        new SizedBox(child: new SceneryWidget(), height: size.height * 0.3, width: size.width),
        new Expanded(
          child: _child
        ),
      ],
    );
  }

}

/**
 * Scenery widget showing a nice and sound scenery for the user to enjoy themselves.
 */
class SceneryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SceneryWidgetState();
}

/**
 * State of the beautiful scenery widget.
 */
class _SceneryWidgetState extends State<SceneryWidget> with SingleTickerProviderStateMixin {

  Animation<double> anim;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    anim = new Tween(begin: 0.0, end: 200.0).animate(controller)..addListener(() {
      setState(() {

      });
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: new _Sky(anim)
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

}

typedef Offset Transform(Offset toTransform);

/**
 * Sky canvas.
 */
class _Sky extends CustomPainter {
  static const List<Offset> HM_LOGO_POINTS = const <Offset>[
    const Offset(0.6213973799126637, 0.0),
    const Offset(0.0, 0.26430131004366814),
    const Offset(0.1888646288209607, 0.7084061135371179),
    const Offset(0.5775109170305677, 0.7084061135371179),
    const Offset(0.8525109170305677, 0.5914847161572052),
    const Offset(0.853056768558952, 0.6131004366812227),
    const Offset(0.8503275109170305, 0.6543668122270742),
    const Offset(0.8483624454148472, 0.6777292576419214),
    const Offset(0.8465065502183405, 0.6907205240174673),
    const Offset(0.8419213973799127, 0.6993449781659389),
    const Offset(0.8295851528384279, 0.7026200873362446),
    const Offset(0.8295851528384279, 0.7081877729257643),
    const Offset(0.875764192139738, 0.7081877729257643),
    const Offset(0.875764192139738, 0.7026200873362446),
    const Offset(0.8617903930131005, 0.6995633187772925),
    const Offset(0.857532751091703, 0.6903930131004367),
    const Offset(0.8574235807860262, 0.6771834061135371),
    const Offset(0.8580786026200873, 0.6575327510917031),
    const Offset(0.8610262008733625, 0.6009825327510917),
    const Offset(0.8614628820960699, 0.6009825327510917),
    const Offset(0.9058951965065501, 0.7068777292576419),
    const Offset(0.909825327510917, 0.7068777292576419),
    const Offset(0.9581877729257643, 0.5982532751091703),
    const Offset(0.9589519650655022, 0.5982532751091703),
    const Offset(0.9597161572052402, 0.6791484716157206),
    const Offset(0.9574235807860262, 0.6983624454148473),
    const Offset(0.9429039301310044, 0.7028384279475982),
    const Offset(0.9429039301310044, 0.7084061135371179),
    const Offset(0.9951965065502184, 0.7084061135371179),
    const Offset(0.9951965065502184, 0.708296943231441),
    const Offset(0.9951965065502184, 0.7027292576419214),
    const Offset(0.9796943231441048, 0.6982532751091703),
    const Offset(0.9767467248908297, 0.6790393013100436),
    const Offset(0.975, 0.6072052401746726),
    const Offset(0.9772925764192141, 0.5889737991266376),
    const Offset(0.9932314410480348, 0.5848253275109171),
    const Offset(0.9932314410480348, 0.5792576419213974),
    const Offset(0.9594978165938864, 0.5792576419213974),
    const Offset(0.9135371179039301, 0.6786026200873363),
    const Offset(0.8683406113537118, 0.5792576419213974)
  ];

  static const double HM_LOGO_MAX_HEIGHT = 0.7084061135371179;
  static const double HM_LOGO_ASPECT_RATIO = 1.4066339066339;

  Animation<double> animation;

  _Sky(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    _drawSky(canvas, rect);
    _drawLogo(canvas, rect);

    _drawCloud(canvas, new Offset(animation.value, 50.0), 100.0);

    _drawSun(canvas, rect);
  }

  void _drawSky(Canvas canvas, Rect rect) {
    var skyGradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromRGBO(135, 202, 255, 1.0), Color.fromRGBO(226, 242, 255, 1.0)],
        stops: [0.0, 1.0]);

    canvas.drawRect(
      rect,
      new Paint()..shader = skyGradient.createShader(rect),
    );
  }

  void _drawSun(Canvas canvas, Rect rect) {
    var gradient = new RadialGradient(center: const Alignment(0.2, -1.2), radius: 0.8, colors: [const Color(0xFFFFFF55), const Color(0x00FFFF00)]);

    canvas.drawRect(
      rect,
      new Paint()..shader = gradient.createShader(rect),
    );
  }

  void _drawLogo(Canvas canvas, Rect rect) {
    var logoGradient = new LinearGradient(
        begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color.fromRGBO(154, 16, 51, 1.0), Color.fromRGBO(228, 0, 0, 1.0)], stops: [0.0, 1.0]);

    double logoWidth = min(rect.height, rect.width) * HM_LOGO_ASPECT_RATIO * 0.8;
    double yOffset = rect.height - HM_LOGO_MAX_HEIGHT * logoWidth;
    double xOffset = rect.width / 2 - logoWidth / 2;

    canvas.drawPath(
        new Path()
          ..addPolygon(_transformPoints(HM_LOGO_POINTS, (offset) => new Offset(offset.dx * logoWidth + xOffset, offset.dy * logoWidth + yOffset)), true),
        new Paint()..shader = logoGradient.createShader(rect));
  }

  void _drawCloud(Canvas canvas, Offset offset, double width) {
    var paint = new Paint()..color = Colors.white;

    double x = offset.dx;
    double y = offset.dy;
    double w = width;
    double h = w / 11 * 6;

    double baseW = w / 11 * 8;
    double baseH = h / 2;

    canvas.drawRect(new Rect.fromLTWH(x, y, baseW, baseH), paint);
    canvas.drawCircle(new Offset(x, y + baseH / 2), baseH / 2, paint);
    canvas.drawCircle(new Offset(x + baseW, y + baseH / 2), baseH / 2, paint);

    canvas.drawCircle(new Offset(x + baseW / 4 * 3, y), baseH / 6 * 5, paint);

    canvas.drawCircle(new Offset(x + baseH, y + baseH / 6), h / 3, paint);
  }

  /**
   * Transform points.
   */
  List<Offset> _transformPoints(List<Offset> points, Transform transformFct) {
    List<Offset> newPoints = new List<Offset>();

    for (Offset p in points) {
      newPoints.add(transformFct.call(p));
    }

    return newPoints;
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      Rect rect = Offset.zero & size;

      return [
        new CustomPainterSemantics(
          rect: rect,
          properties: new SemanticsProperties(
            label: 'Sky',
            textDirection: TextDirection.ltr,
          ),
        ),
      ];
    };
  }

  @override
  bool shouldRepaint(_Sky oldDelegate) =>  animation.value != oldDelegate.animation.value;

  @override
  bool shouldRebuildSemantics(_Sky oldDelegate) => false;
}
