import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home.dart';
import 'package:qr_reader/pages/map.dart';
import 'package:qr_reader/providers/scan_list.dart';
import 'package:qr_reader/providers/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UIProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "QR  READER",
          initialRoute: "home",
          routes: {"home": (_) => HomePage(), "map": (_) => MapPage()},
          theme: ThemeData.dark()),
    );

    //  appBarTheme: AppBarTheme(backgroundColor: Colors.pink),
    //  floatingActionButtonTheme:
    //      FloatingActionButtonThemeData(backgroundColor: Colors.red)),
  }
}
