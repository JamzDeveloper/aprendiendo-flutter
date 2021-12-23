import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final styleText = const TextStyle(fontSize: 23);
  int _accountant = 0;
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
                '$_accountant',
                style: styleText,
              ),
            ],
          ),
        ),
        floatingActionButton: _createButtom());
  }

  Widget _createButtom() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
              child: const Icon(Icons.remove), onPressed: _reduce),
          FloatingActionButton(
              child: const Icon(Icons.exposure_zero), onPressed: _remove),
          FloatingActionButton(child: const Icon(Icons.add), onPressed: _add)
        ]);
  }

  void _add() {
    setState(() => _accountant++);
  }

  void _remove() {
    setState(() => _accountant = 0);
  }

  void _reduce() {
    if (_accountant > 0) {
      setState(() => _accountant--);
    }
  }
}
