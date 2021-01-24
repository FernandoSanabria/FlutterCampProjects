import 'package:ejerciciologin/preferences/preferences_user.dart';
import 'package:ejerciciologin/widget/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final preferences = PreferencesUser();
  @override
  Widget build(BuildContext context) {
    preferences.lastPage = 'login';

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(preferences.token),
      ),
      drawer: Menu()
    );
  }
}
