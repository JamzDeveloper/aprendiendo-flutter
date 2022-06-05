import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' as FlutterSvg;

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Expanded(child: _Slides()), _Dots()],
    ));
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
 final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      print('pagina actual${pageViewController.page}');
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: [
          _sliderImage("assets/svgs/slide-1.svg"),
          _sliderImage("assets/svgs/slide-2.svg"),
          _sliderImage("assets/svgs/slide-3.svg")
        ],
      ),
    );
  }
}

class _sliderImage extends StatelessWidget {
  String url;
  _sliderImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(50),
        child: FlutterSvg.SvgPicture.asset(url));
  }
}
