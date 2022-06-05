import 'package:flutter/material.dart';

import 'package:disenios/screens/basic_design.dart';
import 'package:disenios/screens/scroll_design.dart';
import 'package:disenios/screens/home_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'Diseños',
        initialRoute: 'home_screen',
        routes: {
          'basic_design': (_) => BasicDesignScreen(),
          "scroll_design": (_) => ScrollDesignScreen(),
          "home_screen": (_) => HomeScreen()
        });
  }
}
