import 'dart:async';
import 'package:form_validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // get data from stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passowordStream =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passowordStream, (e, p) => true);
  //insert data in stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // get the last value entered to the stream
  String get email => _emailController.value;
  String get password => _passwordController.value;
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
