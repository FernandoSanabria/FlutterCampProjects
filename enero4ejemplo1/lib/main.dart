import 'package:enero4ejemplo1/src/page/home.dart';
import 'package:enero4ejemplo1/src/provider/provider_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderStatus(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => Home(),
      },
    )
    );
  }
}