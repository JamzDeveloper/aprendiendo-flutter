import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_app/screens/data_plan/components/bacground_image.dart';
class DataPlanScreen extends StatelessWidget {
  const DataPlanScreen({Key? key,
    required this.file}) : super(key: key);
final File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          BackgroundImage(file: file,)
        ],
      )
    );
  }
}
