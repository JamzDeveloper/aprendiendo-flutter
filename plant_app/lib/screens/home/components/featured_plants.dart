import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';



class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FuturePlanCard(
            image: "assets/images/bottom_img_1.png",
            press: () {},
          ),
          FuturePlanCard(
            image: "assets/images/bottom_img_2.png",
            press: () {},
          ),
          FuturePlanCard(
            image: "assets/images/bottom_img_1.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FuturePlanCard extends StatelessWidget {
  const FuturePlanCard({Key? key, required this.image, required this.press})
      : super(key: key);

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(
            top: kDefaultPadding,
            left: kDefaultPadding,
            right: kDefaultPadding),
        width: size.width * 0.7,
        height: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            )),
      ),
    );
  }
}
