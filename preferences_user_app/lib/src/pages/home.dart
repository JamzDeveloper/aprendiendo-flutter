import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/pages/settings.dart';
import 'package:preferences_user_app/src/share_prefs/preferences_user.dart';
import 'package:preferences_user_app/src/widgets/menu_widgets.dart';

class Home extends StatelessWidget {
  static final String routeName = "home";
  final prefs = PreferencesUser();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = Home.routeName;
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Preferences"),
          backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('secundary color: ${prefs.secondaryColor}'),
            Divider(),
            Text('Género: ${prefs.gender == 1 ? "Male" : "Female"}'),
            Divider(),
            Text('User Name: ${prefs.userName}')
          ],
        ));
  }
}
