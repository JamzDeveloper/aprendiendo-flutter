import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _fullName = '';
  String _email = '';
  String _password = '';
  bool _hidePassword = true;
  String _date = '';

  String _selectOption = 'Goku';
  /*List<String> _powers = [
    'Volar',
    'Super sayayin',
    'Kaio-Ken',
    'Cañon Galick',
    'Kamehameha'
  ];
*/
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            _createInput(),
            const Divider(),
            _createEmail(),
            const Divider(),
            _CreatePassword(),
            const Divider(),
            _CreateDate(context),
            const Divider(),
            _createDropdown(),
            const Divider(),
            _createPerson()
          ]),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        counter: Text('Letras ${_fullName.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Nombre completo',
        suffixIcon: const Icon(Icons.accessibility_new_sharp),
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _fullName = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      //autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onSubmitted: (value) {
        setState(() {
          _email = value;
        });
      },
      // onChanged:
    );
  }

  Widget _CreatePassword() {
    return TextField(
      obscureText: _hidePassword,
      //autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: _changeIcon(_hidePassword),
          onPressed: () => setState(() {
            _hidePassword = !_hidePassword;
          }),
        ),
        icon: const Icon(Icons.lock),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _CreateDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      //autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Fecha de nacimineto',
        labelText: 'Fecha de nacimineto',
        suffixIcon: Icon(Icons.date_range_outlined),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _changeIcon(bool value) {
    if (value) {
      return const Icon(Icons.lock_outline);
    }
    return const Icon(Icons.lock_open);
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre: $_fullName'),
      subtitle: Text('Email: $_email'),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2025),
    );

    if (picked != null) {
      _date = picked.toString();
      _inputFieldDateController.value =
          _inputFieldDateController.value.copyWith(
        text: _date,
      );
    }
  }

/*  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];

    for (var can in _powers) {
      list.add(DropdownMenuItem(
        child: Text(can),
        value: can,
      ));
    }
    return list;
  }
*/
  Widget _createDropdown() {
    return DropdownButton<String>(
      value: _selectOption,
      icon: const Icon(Icons.arrow_downward),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _selectOption = newValue!;
        });
      },
      items: <String>["Goku", "Vegeta", "Gohan", "Trunks"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


 //<String>['One', 'Two', 'Free', 'Four']