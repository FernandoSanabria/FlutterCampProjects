import 'package:flutter/material.dart';
import '../pages/contador_page.dart';


class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContadorPage(),
    );
  }
}