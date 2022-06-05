import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Page'),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              _createSlider(),
              const Divider(),
              Text('Valor Obtenido: $_valorSlider'),
              const Divider(),
              _creteCheckBox(),
              const Divider(),
              _createSwitch(),
              const Divider(),
              Expanded(child: _createImage())
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        value: _valorSlider,
        label: 'tamaño de la imagen $_valorSlider',
        // divisions: 10,
        min: 0,
        max: 500,
        onChanged: (_blockCheck)
            ? null
            : (double newValor) {
                setState(() {
                  _valorSlider = newValor.roundToDouble();
                });
              });
  }

  Widget _createImage() {
    return FadeInImage(
      placeholder: const AssetImage('assets/jar-loading.gif'),
      image: const NetworkImage(
          'https://i.pinimg.com/originals/51/8b/24/518b24f7076e5a9f941174ee12bd4df2.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset('assets/he_vuelto_a_caer.jpg', fit: BoxFit.cover);
      },
    );
  }

  Widget _creteCheckBox() {
    //return Checkbox(
    //    value: _blockCheck,
    //    onChanged: (value) {
    //      setState(() {
    //        _blockCheck = value!;
    //      });
    //    });
    return CheckboxListTile(
        title: const Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = (value == null) ? false : value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: const Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = (value == null) ? false : value;
          });
        });
  }
}
