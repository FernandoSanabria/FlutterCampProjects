import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pushnotifications/src/services/message_stream.dart';



class PostNotification {
  final url = 'https://fcm.googleapis.com/fcm/send';
  String comodin = '';

  Future sendData({nombres, mensaje, token, keyFirebase}) async {

  // final servicioStreamValues = MessageStream();

  //   servicioStreamValues.tokenStream.listen((token) { 

  //       print(token);
  //     comodin = token;
      
  //   });

  //   servicioStreamValues.nameStream.listen((token) { 

  //       print(token);
  //     comodin = token;
      
  //   });
  //   servicioStreamValues.keyFirebaseStream.listen((token) { 

  //       print(token);
  //     comodin = token;
      
  //   });




    final data = {
      "notification": {
        "body": "this is you know a body",
        "title": "this is you know a title"
      },
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "nombres": "Edwin Fernando Sanabria Marroquín: $mensaje",
        // "mensaje": "$mensaje" 
      },
      "to":
          "$token"
    };

   final response=  await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'key=$keyFirebase',
      },
      body: json.encode(data)
    );
    print(response.statusCode);
    print('Successful post in database');
  }
}
