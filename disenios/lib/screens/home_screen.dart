import 'package:disenios/widgets/card_table.dart';
import 'package:disenios/widgets/custom_button_navegation_bar.dart';
import 'package:disenios/widgets/page_ttile.dart';
import 'package:flutter/material.dart';
import 'package:disenios/widgets/background.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background
          BackgroundWidget(),

          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomButtonNavegationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [PageTittle(), CardTable()],
      ),
    );
  }
}
