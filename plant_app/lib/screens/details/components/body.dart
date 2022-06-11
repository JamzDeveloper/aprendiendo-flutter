import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' as FlutterSvg;
import 'package:plant_app/constants.dart';

import 'package:plant_app/screens/details/components/Title_and_price.dart';

import 'package:plant_app/screens/details/components/iamge_and_icons.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          imageAndIcons(size: size),
          TitleAndPrice(
            title: "Zanahoria",
            country: "Peru",
            price: 39.3,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  child: const Text(
                    "Buy Now",
                    style:TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)))),
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                  child: TextButton(
                child: Text("Description",style: TextStyle(
                  fontSize: 16
                ),),
                onPressed: () {},
              ))
            ],
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          )
        ],
      ),
    );
  }
}
