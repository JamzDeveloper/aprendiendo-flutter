import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['one', 'two', 'three', 'four', 'five'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('components temp'),
      ),
      body: ListView(children: _createItemsShort()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = <Widget>[];
    for (String opc in options) {
      final tempWidget = ListTile(
        title: Text(opc),
      );
      list
        ..add(tempWidget)
        ..add(const Divider());
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    var widgets = options
        .map((e) => Column(children: <Widget>[
              ListTile(
                  title: Text(e),
                  subtitle: const Text('subtitle'),
                  leading: const Icon(Icons.account_balance_wallet),
                  trailing: const Icon(Icons.keyboard_arrow_right)),
              const Divider()
            ]))
        .toList(); //convertimos a una list que es widget

    return widgets;
  }
}
