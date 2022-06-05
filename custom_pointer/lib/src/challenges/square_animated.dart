import 'package:flutter/material.dart';

class SquareAnimated extends StatelessWidget {
  const SquareAnimated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AnimatedSquare()),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  //animations
  Animation<double>? movedRight;
  Animation<double>? movedLeft;
  Animation<double>? movedtop;
  Animation<double>? movedBottom;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    movedRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));

    movedtop = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));
    super.initState();

    movedLeft = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));

    movedBottom = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));
    controller!.addListener(() {
      print('Status: ${controller?.status}');
      if (controller?.status == AnimationStatus.completed) {
        //controller?.reverse();
    
      }
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller?.forward();
    return AnimatedBuilder(
        animation: controller!,
        child: _Square(),
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(movedRight!.value - movedLeft!.value,
                movedtop!.value + movedBottom!.value),
            child: child,
          );
        });
  }
}

class _Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
