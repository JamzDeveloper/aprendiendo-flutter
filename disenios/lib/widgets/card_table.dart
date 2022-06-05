import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SigleCard(
            color: Colors.blue,
            icon: Icons.border_all,
            text: "General",
          ),
          _SigleCard(
            color: Colors.pinkAccent,
            icon: Icons.car_rental,
            text: "Transport",
          )
        ]),
        TableRow(children: [
          _SigleCard(
            color: Colors.red,
            icon: Icons.dangerous,
            text: "Dangerous",
          ),
          _SigleCard(
            color: Colors.green,
            icon: Icons.access_alarm,
            text: "Alarm",
          )
        ]),
        TableRow(children: [
          _SigleCard(
            color: Colors.purple,
            icon: Icons.pause_presentation,
            text: "Presentation",
          ),
          _SigleCard(
            color: Colors.orange,
            icon: Icons.radar,
            text: "Radar",
          )
        ]),
        TableRow(children: [
          _SigleCard(
            color: Colors.blue,
            icon: Icons.border_all,
            text: "General",
          ),
          _SigleCard(
            color: Colors.pinkAccent,
            icon: Icons.car_rental,
            text: "Transport",
          )
        ]),
      ],
    );
  }
}

class _SigleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SigleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return _CardBackground(child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          radius: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(color: this.color, fontSize: 18),
        )
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 5),
          child: Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: child,
          ),
        ),
      ),
    );
  }
}
