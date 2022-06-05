import 'package:flutter/material.dart';

class CustomButtonNavegationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: "calendar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_circle), label: "Clime"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Super chat")
        ]);
  }
}
