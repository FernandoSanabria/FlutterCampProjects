import 'package:ejerciciologin/bloc/provider.dart';
import 'package:ejerciciologin/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {'login': (BuildContext context) => LoginPage()},
        theme: ThemeData(primarySwatch: Colors.red),
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Material App',
    //   initialRoute: 'login',
    //  routes: {
    //  'login': (BuildContext context) => LoginPage()
    //  },
    //  theme: ThemeData(primarySwatch: Colors.red),

    // );
  }
}
