import "package:flutter/material.dart";
class CardRemedyPlant extends StatelessWidget {
  const CardRemedyPlant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/image_1.png",
              width: 90,
              height: 90,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cyantraliprole",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "insecticida",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black45),
              ),
            ],
          )
        ],
      ),
    );
  }
}
