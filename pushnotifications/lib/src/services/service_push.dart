import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pushnotifications/src/services/message_stream.dart';

// @override
// void initState() { 
//   super.initState();
//   final  mi = '';  
// }

class ServicePush{

 

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajeStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajesStream => _mensajeStreamController.stream;






  static Future<dynamic> mensajePush(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      
      final dynamic notification = message['notification'];
    }
    
  }

  iniciarNotificaciones() async{

    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print("====================== token =================" + token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: mensajePush,
      onLaunch: onLaunch,
      onResume: onResume,
    );

  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    
    print("==========onMessage=============");

    final argumento = message['data'];
    _mensajeStreamController.sink.add(argumento['nombres']);

    print(message);
    
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    
    print("==========onLaunch=============");
    // al final para el stream
    final argumento = message['data'];
    _mensajeStreamController.sink.add(argumento['nombres']);

    print(argumento);
    
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    
    print("==========onResume=============");
    
    // al final para el stream
    final argumento = message['data'];
    _mensajeStreamController.sink.add(argumento['nombres']);

    print(argumento);
    
  }

  dispose(){
    _mensajeStreamController?.close();
    // _tokenStreamController?.close();
  }

}


// import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:pushnotifications/src/services/message_stream.dart';

// class ServicePush{

//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//    MessageStream _messageStream = MessageStream();
   

//   static Future<dynamic> mensajePush(Map<String, dynamic> message) async {
//     if (message.containsKey('data')) {
      
//       final dynamic data = message['data'];
//     }

//     if (message.containsKey('notification')) {
      
//       final dynamic notification = message['notification'];
//     }
    
//   }

//   iniciarNotificaciones() async{

//     await _firebaseMessaging.requestNotificationPermissions();
//     final token = await _firebaseMessaging.getToken();

//     print("====================== token =================" + token);

//     _firebaseMessaging.configure(
//       onMessage: onMessage,
//       onBackgroundMessage: mensajePush,
//       onLaunch: onLaunch,
//       onResume: onResume,
//     );

//   }

//   Future<dynamic> onMessage(Map<String, dynamic> message) async {
    
//     print("==========onMessage=============");
//         _messageStream.addMessage(message);


//     final argumento = message['data'];

//     print(message);

//     print(argumento);
    
//   }

//   Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    
//     print("==========onLaunch=============");
//         _messageStream.addMessage(message);

//     // al final para el stream
//     final argumento = message['data'];

//     print(argumento);
    
//   }

//   Future<dynamic> onResume(Map<String, dynamic> message) async {
    
//     print("==========onResume=============");
//     _messageStream.addMessage(message);
    
//     // al final para el stream
//     final argumento = message['data'];

//     print(message);

//     print(argumento);
    
//   }

// }