import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/pages/home.dart';
import 'package:preferences_user_app/src/pages/settings.dart';
import 'package:preferences_user_app/src/share_prefs/preferences_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferencesUser();
  await prefs.initiPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferencesUser();
    return MaterialApp(
      title: 'Material App',
      initialRoute: prefs.lastPage,
      routes: {
        Home.routeName: ((context) => Home()),
        Settings.routeName: ((context) => Settings())
      },
    );
  }
}
