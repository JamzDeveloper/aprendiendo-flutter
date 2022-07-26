import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/disease_plan/components/appbar_detail.dart';
import 'package:plant_app/screens/disease_plan/components/body_disease_plan.dart';
import 'package:plant_app/screens/disease_plan/components/build_sliver_head.dart';

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
              child: BodyDiseasePlan(),
            ))
          ],
        ),
        AppBarDetail()
      ],
    ));
  }
}
