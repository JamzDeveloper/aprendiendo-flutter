import 'package:flutter/material.dart';
import 'dart:io';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key,
    required this.file}) : super(key: key);

  final File file;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top:0,
        left: 0,
        right: 0,
        bottom: 0,
        child:Image.file(file,
        fit: BoxFit.cover,
        ),
    );
  }
}
