import 'package:flutter/material.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
      height: kToolbarHeight,
      margin: EdgeInsets.only(top: 30, left: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            // margin: const EdgeInsets.only(top: 20, left: 4),

            width: 55,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0, // changes position of shadow
                ),
              ],
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 40,
                )),
          )
        ],
      ),
    );
  }
}
