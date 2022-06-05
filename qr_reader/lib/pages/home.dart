import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/directions.dart';
import 'package:qr_reader/pages/maps.dart';
import 'package:qr_reader/providers/db.dart';
import 'package:qr_reader/providers/scan_list.dart';
import 'package:qr_reader/providers/ui.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("Historial")),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false).deleteAll();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //get selected from provider
    final uiProvider = Provider.of<UIProvider>(context);

    final currexIndex = uiProvider.selectedMenuOpt;

//used scan list provider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currexIndex) {
      case 0:
        scanListProvider.loadScanByType("geo");
        return MapsPage();
      case 1:
        scanListProvider.loadScanByType("http");
        return DirecctionsPage();
      default:
        return MapsPage();
    }

    ;
  }
}
