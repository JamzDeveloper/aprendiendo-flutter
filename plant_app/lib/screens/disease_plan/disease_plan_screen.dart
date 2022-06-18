import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/disease_plan/components/appbar_detail.dart';
import 'package:plant_app/screens/disease_plan/components/build_sliver_head.dart';
import 'package:plant_app/screens/disease_plan/components/description.dart';

class DiseasePlanScreen extends StatelessWidget {
  const DiseasePlanScreen({Key? key, required this.file}) : super(key: key);
  final File file;
  final double expandedHeight = 340;
  final double roundedContainerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            BuildSliverHead(
                file: file,
                expandedHeight: expandedHeight,
                roundedContainerHeight: roundedContainerHeight),
            SliverToBoxAdapter(
                child: Container(
              padding: EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
              color: Colors.white,
              child: Column(
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
                  Card(
                    elevation: 3,
                    child: Row(
                      children: [
                        Container(
                          padding:EdgeInsets.all(8),
                          child: Image.asset(
                            "assets/images/image_1.png",
                            width: 90,
                            height: 90,

                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cyantraliprole",style: TextStyle(fontSize: 20),),
                            Text(
                              "insecticida",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.black45),
                            ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
        AppBarDetail()
      ],
    ));
  }
}
