import 'package:flutter/material.dart';

class Avatar_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://tse4.mm.bing.net/th?id=OIP.nkxE6q3mvcqWi7Tf6oz2wwHaJu'),
            radius: 20.0,
          ),
          Container(
              margin: const EdgeInsets.all(5.0),
              child: const CircleAvatar(
                child: Text('TM'),
                backgroundColor: Colors.grey,
              ))
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://tse4.mm.bing.net/th?id=OIP.cQfcabLG3iQneCFM6YfbmAHaE7'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
