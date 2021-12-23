import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';
//import 'package:components/src/pages/home_temp.dart';

import 'package:components/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      //home: HomePage()
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'ES'), // Spanish, no country code
        Locale('en', 'US'), // English, no country code
      ],
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage(),
        );
      },
    );
  }
}
