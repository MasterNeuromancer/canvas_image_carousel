import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyCanvas extends CustomPainter {
  ui.Image bgImage;
  MyCanvas(this.bgImage);
  @override
  void paint(Canvas canvas, Size size) {
    var offset = Offset(size.width / 2, size.height / 2);

    drawImage(canvas, offset);
    drawFrame(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  var W = 600.0;
  void drawFrame(Canvas canvas, Offset offset) {
    var rect = Rect.fromCenter(center: offset, width: W, height: W);
    var border = Paint()
      ..color = Colors.black
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, border);
  }

  void drawImage(Canvas canvas, Offset offset) {
    var rect = Rect.fromCenter(center: offset, width: W, height: W);
    paintImage(this.bgImage, rect, canvas, Paint(), BoxFit.cover);
  }

  void paintImage(
      ui.Image image, Rect outputRect, Canvas canvas, Paint paint, BoxFit fit) {
    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());
    final FittedSizes sizes = applyBoxFit(fit, imageSize, outputRect.size);
    final Rect inputSubrect =
        Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect =
        Alignment.center.inscribe(sizes.destination, outputRect);
    canvas.drawImageRect(image, inputSubrect, outputSubrect, paint);
  }
}
