import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';

export 'package:form_validation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static late Provider? _instance = null;
  factory Provider({Key? key, required Widget child}) {
    if (_instance == null) {
      _instance = Provider._internal(
        key: key,
        child: child,
      );
    }
    return _instance!;
  }

  Provider._internal({Key? key, required Widget child})
      : super(key: key, child: child);

  final loginBloc = LoginBloc();

  //Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;
  }
}
