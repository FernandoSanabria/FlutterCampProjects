import 'dart:async';
import 'package:pushnotifications/src/services/validations.dart';

class MessageStream  {
  // final _messageDataController =
  //     StreamController<Map<String, dynamic>>.broadcast();

  // Stream<Map<String, dynamic>> get messageDataStream =>
  //     _messageDataController.stream.transform(validateMessage);

  // Function(Map<String, dynamic>) get messageData =>
  //     _messageDataController.sink.add;

  // void addMessage(Map<String, dynamic> msg) {
  //   _messageDataController.add(msg);
  //   return;
  // }

  final _tokenConversationStreamController =
      StreamController<String>.broadcast();
  Stream<String> get tokenStream => _tokenConversationStreamController.stream;

  final _keyFirebaseConversationStreamController =
      StreamController<String>.broadcast();
  Stream<String> get keyFirebaseStream =>
      _keyFirebaseConversationStreamController.stream;

  final _namePersonConversationStreamController =
      StreamController<String>.broadcast();
  Stream<String> get nameStream =>
      _namePersonConversationStreamController.stream;

  void addToken(String msg) {
    _tokenConversationStreamController.sink.add(msg);
    // return;
  }

  void addName(String msg) {
    _keyFirebaseConversationStreamController.sink.add(msg);
    // return;
  }

  void addKeyFirebase(String msg) {
    _namePersonConversationStreamController.sink.add(msg);
    // return;
  }

  dispose() {
    // _messageDataController?.close();
    _tokenConversationStreamController?.close();
    _keyFirebaseConversationStreamController?.close();
    _namePersonConversationStreamController?.close();
  }
}
