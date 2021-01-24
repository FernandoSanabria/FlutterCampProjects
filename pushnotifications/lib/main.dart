
import 'package:flutter/material.dart';
import 'package:pushnotifications/src/pages/chat_page.dart';
import 'package:pushnotifications/src/services/service_push.dart';
import 'package:pushnotifications/src/services/message_stream.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {






  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'chat',
      routes: {
        'chat': (BuildContext context) => ChatPage()
      },
 
    );
  }
}
