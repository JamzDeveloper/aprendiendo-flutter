import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Image(
          image: AssetImage("assets/paisaje_oso.jpg"),
        ),

        //Tittle
        const Tittle(),

        //button seccion
        const ButtonSecction(),

        //description
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"))
      ],
    ));
  }
}

class Tittle extends StatelessWidget {
  const Tittle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Oeschine Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text("45")
        ],
      ),
    );
  }
}

class ButtonSecction extends StatelessWidget {
  const ButtonSecction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CustomButton(icon: Icons.call, text: "Call"),
          CustomButton(icon: Icons.send, text: "Router"),
          CustomButton(icon: Icons.share, text: "Share"),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 25,
        ),
        Text(text, style: const TextStyle(color: Colors.blue))
      ],
    );
  }
}
