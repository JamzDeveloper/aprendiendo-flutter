import 'package:flutter/material.dart';
import 'package:plant_app/screens/disease_plan/components/card_remedy_plant.dart';
import 'package:plant_app/screens/disease_plan/components/description.dart';
class BodyDiseasePlan extends StatelessWidget {
  const BodyDiseasePlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Áfidos o pulgon",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Insecto",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black45),
                )
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.share,
                  size: 35,
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: DescriptionTextWidget(
              text:
              """dm has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."""),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sintomas",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: DescriptionTextWidget(
              text:
              """dm has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."""),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Tratamiento",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        CardRemedyPlant()
      ],
    );
  }
}
