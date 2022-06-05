import 'package:flutter/material.dart';
import 'package:form_validation/src/pages/home_page.dart';
import 'package:form_validation/src/pages/login_page.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/pages/product_page.dart';
import 'package:form_validation/src/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (context) => LoginPage(),
          'register': (context) => RegisterPages(),
          'home': (context) => HomePage(),
          'product': (context) => ProductPage()
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
