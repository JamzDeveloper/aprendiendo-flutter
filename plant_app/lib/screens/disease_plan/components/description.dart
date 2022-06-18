import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
 late String firstHalf ;
 late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 250) {
      firstHalf = widget.text.substring(0, 250);
      secondHalf = widget.text.substring(250, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: secondHalf.isEmpty
          ?  Text(firstHalf,textAlign: TextAlign.justify)
          :  Column(
        children: <Widget>[
           Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf),textAlign: TextAlign.justify,),
           InkWell(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start
              ,
              children: <Widget>[
                 Container(
                   margin:const EdgeInsets.only(top: 3),
                   child: Text(
                    flag ? "show more" : "show less",
                    style: new TextStyle(color: kPrimaryColor),
                ),
                 ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}