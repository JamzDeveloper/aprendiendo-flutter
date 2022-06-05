import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/pages/home.dart';
import 'package:preferences_user_app/src/pages/settings.dart';
import 'package:preferences_user_app/src/share_prefs/preferences_user.dart';

class MenuWidget extends StatelessWidget {
  final prefs = PreferencesUser();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/menu-img.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.pages,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: const Text("Pages"),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == Home.routeName) {
                Navigator.pop(context);
                return;
              }
              Navigator.popAndPushNamed(context, Home.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: const Text("Party Mode"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: const Text("People"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: const Text("Settings"),
            onTap: () {
              // Navigator.pop(context);
              //Navigator.pushNamed(context, Settings.routeName);
              if (ModalRoute.of(context)?.settings.name == Settings.routeName) {
                Navigator.pop(context);
                return;
              }
              Navigator.pushReplacementNamed(context, Settings.routeName);
            },
          ),
        ],
      ),
    );
  }
}
