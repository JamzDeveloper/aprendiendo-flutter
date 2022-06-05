import 'package:preferences_user_app/src/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instance = PreferencesUser._internal();

  factory PreferencesUser() {
    return _instance;
  }
  PreferencesUser._internal();

  late SharedPreferences _prefs;

  initiPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get gender {
    return _prefs.getInt("gender") ?? 1;
  }

  set gender(int value) {
    _prefs.setInt("gender", value);
  }

  bool get secondaryColor {
    return _prefs.getBool("secondaryColor") ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool("secondaryColor", value);
  }

  String get userName {
    String result = _prefs.getString("userName") ?? "";
    print(result);
    if (result != "") {
      final arr = result.split(" ");

      result = "";
      for (String element in arr) {
        result +=
            " " + element[0].toUpperCase() + element.substring(1).toLowerCase();
      }
    }
    return result;
  }

  set userName(String value) {
    _prefs.setString("userName", value);
  }

  String get lastPage {
    return _prefs.getString("lastPage") ?? Home.routeName;
  }

  set lastPage(String value) {
    _prefs.setString("lastPage", value);
  }
}
