import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart' as AnimateTo;
import 'package:plant_app/screens/home/home_screen.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/background_presentation.jpg",
                fit: BoxFit.cover),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.35),
          ),
          Positioned(
            top: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, bottom: 20),
                  child: AnimateTo.FadeInUpBig(
                    child: Text(
                      "Detection PlantApp",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 10,
                  margin: EdgeInsets.only(left: 30),
                  child: AnimateTo.FadeInUpBig(
                    child: Text(
                      "Cada planta necesita sus propias condiciones para crecer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          overflow: TextOverflow.clip),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            width: 80,
            bottom: 30,
            right: 25,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context)
                => HomeScren()));

              },
              child: Image.asset(
                "assets/images/nextgif.gif",
                scale: 10,
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.only(left: 5, right: 5)),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
