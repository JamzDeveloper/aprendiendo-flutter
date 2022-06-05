import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
        0.5,
        0.5
      ],
          colors: [
        Color(0xff80E9CA),
        Color(0xff50C2DD),
      ]));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: boxDecoration,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [Page1(), Page2()],
          )),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //backgroud images
        Backgroud(),
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontSize: 55, fontWeight: FontWeight.bold, color: Colors.white);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text("11°", style: textStyle),
          Text(
            "Miercoles",
            style: textStyle,
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Backgroud extends StatelessWidget {
  const Backgroud({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff50C2DD),
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: Image(image: AssetImage('assets/scroll-1.png')));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff50C2DD),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
