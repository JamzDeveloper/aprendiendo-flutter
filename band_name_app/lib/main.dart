import 'package:band_name_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_name_app/pages/status.dart';

import 'package:band_name_app/pages/home.dart';


void main()=> runApp(MyApp());


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SocketService() ,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "material app",
        initialRoute: "status",
        routes:{
          "home":(context)=> HomePage(),
          "status":(context)=>StatusPage(),
        }

      ),
    );
  }

}