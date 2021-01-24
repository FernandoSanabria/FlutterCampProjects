import 'package:ejerciciologin/bloc/provider.dart';
import 'package:ejerciciologin/pages/home_page.dart';
import 'package:ejerciciologin/pages/login_page.dart';
import 'package:ejerciciologin/pages/multimedia_page.dart';
import 'package:ejerciciologin/preferences/preferences_user.dart';
import 'package:flutter/material.dart';

void main() async {
  final preferences = new PreferencesUser(); 
  WidgetsFlutterBinding();
  await preferences.initPreferences();

  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final preferences = PreferencesUser();

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {'login': (BuildContext context) => LoginPage(),
        'home':(BuildContext context) => HomePage(),
        'multimedia': (BuildContext context) => MultimediaPage()
        },
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
