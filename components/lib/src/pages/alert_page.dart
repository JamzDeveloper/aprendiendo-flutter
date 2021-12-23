import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertPage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Mostrar Alerta'),
          onPressed: () => _viewAlert(context),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              primary: Colors.blue,
              shape: const StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_arrow_left),
        onPressed: () => {Navigator.pop(context)},
      ),
    );
  }

  void _viewAlert(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: const Text('Mensanje de Alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Mensanje de Alerta'),
                const Text('abel baboso'),
                Image.asset('assets/he_vuelto_a_caer.jpg', fit: BoxFit.cover)
              ],
            ),
            actions: [
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }
}
