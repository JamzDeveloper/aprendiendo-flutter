import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' as FlutterSVG;
import 'package:plant_app/components/my_buttom_appbar.dart';

import 'package:plant_app/screens/home/components/body.dart';

class HomeScren extends StatelessWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyHome(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(

      elevation: 0,
      leading: IconButton(
        icon: FlutterSVG.SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
