import 'dart:io';

import 'package:band_name_app/pages/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "2", name: "Iron Maiden", votes: 4),
    Band(id: "3", name: "Black Sabbath", votes: 3),
    Band(id: "4", name: "Deep Purple", votes: 2),
    Band(id: "5", name: "Led Zeppelin", votes: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Bands Name",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, index) => _bandTile(bands[index])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 4,
        onPressed: addNewBand,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
         print('${direction}');
      },
      background: Container(
        padding:const EdgeInsets.only(right: 8.0),
        color: Colors.red,
        child:const Align(
          alignment: Alignment.centerRight,
          child: Text("Delete band",style: TextStyle(color: Colors.white),),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title:const Text("New Band Name"),
                content: TextField(
                  controller: textController,
                ),
                actions: <Widget>[
                  MaterialButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  MaterialButton(
                    child: const Text("Add"),
                    onPressed: () => addBandTolist(textController.text),
                  )
                ]);
          });
    }
    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: const Text("New Band Name"),
              content: CupertinoTextField(
                controller: textController,
              ),
              actions: [
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context)),
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("Add"),
                    onPressed: () => addBandTolist(textController.text))
              ],
            ));
  }

  addBandTolist(String name) {
    if (name.length > 1) {
      setState(() {
        bands.add(Band(id: DateTime.now().toString(), name: name, votes: 4));
      });
    }
    print(name);
    // final newBand = Band(id: DateTime.now().toString(), name: name, votes: 0);
    // setState(() {
    //   bands.add(newBand);
    // });
    Navigator.pop(context);
  }
}
