import 'package:flutter/material.dart';


class CircleIndicator extends Decoration {
  final BoxPainter _painter;
  CircleIndicator({required Color color, required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([ VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this. radius) : _paint = Paint()
  ..color = color
  ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    // TODO: implement paint
    final Offset circleOffset = offset + Offset(config.size!.width / 2, config.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}