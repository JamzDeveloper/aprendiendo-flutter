import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/share_prefs/preferences_user.dart';

import 'package:preferences_user_app/src/widgets/menu_widgets.dart';

class Settings extends StatefulWidget {
  static final String routeName = "settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _secondaryColor = false;

  String _name = "";
  int? _grupo;
  int? value = 1;
  int? value2 = 2;

  late TextEditingController _textController;
  PreferencesUser prefs = PreferencesUser();
  @override
  void initState() {
    _grupo = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _name = prefs.userName;
    prefs.lastPage = Settings.routeName;
    _textController = TextEditingController(text: _name);
    super.initState();
  }

  _setSelectedRadio(int? valor) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setInt('gender', valor!);
    prefs.gender = valor!;
    setState(() {
      _grupo = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
          ),
          backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              title: const Text("Second Color"),
              activeColor: Colors.teal,
              inactiveThumbColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  _secondaryColor = value;
                  prefs.secondaryColor = value;
                });
              },
            ),
            RadioListTile(
                value: value!,
                groupValue: _grupo,
                activeColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                title: const Text("Male"),
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: value2!,
                groupValue: _grupo,
                activeColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                title: const Text("Female"),
                onChanged: _setSelectedRadio),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                cursorColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                controller: _textController,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                    ),
                    labelText: "Name",
                    helperText: "Name of the person using the phone "),
                onChanged: (value) {
                  prefs.userName = value;
                },
              ),
            )
          ],
        ));
  }
}
