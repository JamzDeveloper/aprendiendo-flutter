import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoWidgets(),
      ),
    );
  }
}

class CuadradoWidgets extends StatefulWidget {
  @override
  State<CuadradoWidgets> createState() => _CuadradoWidgetsState();
}

class _CuadradoWidgetsState extends State<CuadradoWidgets>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  Animation<double>? rotation;
  Animation<double>? opacity;
  Animation<double>? opacityOut;
  Animation<double>? moved;
  Animation<double>? large;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1700));

    //Controlar el tiempo de la animacion de la rotacion
    rotation = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    //Controlar el tiempo de la animacion de la opacidad

    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller!, curve: Interval(0, 0.55, curve: Curves.easeOut)));

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    //Controlar el tiempo de la animacion de mover
    // moved = Tween(begin: 0.0, end: 200.0)
    //     .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    //Controlar el tiempo de la animacion de agrandar el elemento
    large = Tween(begin: 0.0, end: 13.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    controller!.addListener(() {
      print('Status: ${controller?.status}');
      if (controller?.status == AnimationStatus.completed) {
        controller?.reverse();
        // controller?.reset();
      }
    });
    //controller?.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //reproduction
    //controller?.repeat();
    controller?.forward();

    return AnimatedBuilder(
        animation: controller!,
        child: _Rectangulo(),
        builder: (BuildContext context, Widget? childRectangulo) {
          return Transform.translate(
            offset: Offset(0, 0),
            child: Transform.rotate(
                angle: 0, //rotation!.value,
                child: Opacity(
                  opacity: opacity!.value - opacityOut!.value,
                  child: Transform.scale(
                      scale: large!.value, child: childRectangulo),
                )),
          );
        });
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
