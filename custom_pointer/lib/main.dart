import 'package:custom_pointer/src/challenges/square_animated.dart';
import 'package:custom_pointer/src/pages/animation_page.dart';
import 'package:custom_pointer/src/pages/headers_page.dart';
import 'package:custom_pointer/src/pages/slidershow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Design app',
        home: SlideShowPage());
  }
}
