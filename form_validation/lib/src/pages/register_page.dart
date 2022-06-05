import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';

class RegisterPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_createBackground(context), _loginForm(context)],
    ));
  }

  _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundPurple = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0),
      ])),
    );
    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
    return Stack(
      children: [
        backgroundPurple,
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, right: -30.0, child: circle),
        Positioned(bottom: -50, right: -10.0, child: circle),
        Positioned(bottom: 120.0, right: 20.0, child: circle),
        Positioned(bottom: -50.0, left: -20.0, child: circle),
        Container(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: const [
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                "Jamz Developer",
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        )
      ],
    );
  }

  _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 180,
          )),
          Container(
            width: size.width * 0.85,
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                const Text(
                  "create account",
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                _createEmail(bloc),
                const SizedBox(
                  height: 30,
                ),
                _createPassword(bloc),
                const SizedBox(
                  height: 30,
                ),
                _createButton(bloc)
              ],
            ),
          ),
          TextButton(
            child: Text('Login with account'),
            onPressed: () => Navigator.pushReplacementNamed(context, "login"),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }

  _createEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.alternate_email,
                    color: Colors.purple,
                  ),
                  hintText: "ejemplo@correo.com",
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color:
                          snapshot.hasError ? Colors.red : Colors.deepPurple),
                  counterText: snapshot.data,
                  errorText:
                      snapshot.hasError ? snapshot.error.toString() : null,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple))),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }
}

_createPassword(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.passowordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.lock_outline,
              color: Colors.purple,
            ),
            labelText: "Password",
            labelStyle: TextStyle(
                color: snapshot.hasError ? Colors.red : Colors.deepPurple),
            counterText: snapshot.data,
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple)),
          ),
          onChanged: bloc.changePassword,
        ),
      );
    },
  );
}

_createButton(LoginBloc bloc) {
  return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              child: const Text("Long in"),
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurple),
            ),
            onPressed: snapshot.hasData ? () => _Login(context, bloc) : null);
      });
}

_Login(BuildContext context, LoginBloc bloc) {
  print('------------------');
  print('Email : ${bloc.email}');
  print('Password: ${bloc.password}');
  print('==================');
  Navigator.pushReplacementNamed(context, 'home');
}
