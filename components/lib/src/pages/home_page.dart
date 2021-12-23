import 'package:flutter/material.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

import 'package:components/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("components"),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //menuProvider.loadData().then((opcions) {
    //  print(opcions);
    //});

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    for (var opt in data) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          // final route = MaterialPageRoute(builder: (context) {
          //   return AlertPage();
          // });
          // Navigator.push(context, route);
        },
      );

      options
        ..add(widgetTemp)
        ..add(const Divider());
    }
    return options;
  }
}
