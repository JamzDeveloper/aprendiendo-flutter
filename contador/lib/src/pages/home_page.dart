import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final styleText = const TextStyle(fontSize: 23);
  final accountant = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('title'),
          centerTitle: true,
          backgroundColor: const Color(0xFF42A5F5),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "namber of click",
                style: styleText,
              ),
              Text(
                '$accountant',
                style: styleText,
              ),
            ],
          ),
        ),
        floatingActionButton: _createButtom()
        /* FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // ignore: avoid_print
          
        },
      ), */
        );
  }

  Widget _createButtom() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {},
    );
  }
}
