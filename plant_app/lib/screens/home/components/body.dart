import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/featured_plants.dart';
import 'package:plant_app/screens/home/components/header_with_searchbox.dart';
import 'package:plant_app/screens/home/components/recomend_plants.dart';
import 'package:plant_app/screens/home/components/title_with_more_bbtn.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
            text: "Recomendado",
            press: () {},
          ),
          RecomendsPlants(),
          TitleWithMoreBtn(
            text: "Futuras plantas ",
            press: () {},
          ),
          FeaturedPlants(),
         const SizedBox(
            height: kDefaultPadding,
          )
        ],
      ),
    );
  }
}
