import 'package:custom_pointer/src/widgets/heasders_widgets.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveGradientHeader(),
    );
  }
}
