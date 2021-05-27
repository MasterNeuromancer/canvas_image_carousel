import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'my-canvas.dart';

class MyPainter extends StatefulWidget {
  @override
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  @override
  void initState() {
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex++;
            selectedImage = images.length > 0
                ? images[selectedIndex % images.length]
                : null;
          });
        },
        child: CustomPaint(
          child: Container(),
          painter: MyCanvas(selectedImage),
        ),
      ),
    );
  }

  var images = [];
  late ui.Image selectedImage;
  int selectedIndex = 0;
  Future<void> loadImages() async {
    var names = ["01.jpg", "02.jpg", "03.jpg"];
    names.forEach((name) {
      rootBundle.load("assets/images/outdoor-bg-$name").then((bd) {
        decodeImageFromList(bd.buffer.asUint8List()).then((img) {
          setState(() {
            images.add(img);
            selectedImage = (images.length > 0 ? images[0] : null);
          });
        });
      });
    });
  }
}
