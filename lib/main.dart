import 'package:flutter/material.dart';

import 'my-painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canvas Image Carousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPainter(),
    );
  }
}
