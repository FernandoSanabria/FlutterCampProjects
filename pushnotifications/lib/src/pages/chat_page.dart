import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert';

import 'package:pushnotifications/src/services/post_notification.dart';
import 'package:pushnotifications/src/services/message_stream.dart';
import 'package:pushnotifications/src/services/service_push.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final servicePostNotification = PostNotification();

  String token = '';
  String keyFirebase = '';
  String user = 'machine';
  String textForm = '';
  List<String> listTiles = [];
  Map<String,String> mapTiles = {};


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final servicioPush = ServicePush();
    servicioPush.iniciarNotificaciones();
    final servicioStreamValues = MessageStream();

    servicioStreamValues.tokenStream.listen((token) {
      print(token);
    });

    servicioPush.mensajesStream.listen((argumento) {
      print("argumento desde main: $argumento");
      
      // listTiles.add(argumento);

      mapTiles['machine'] = argumento;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: user == '' ? Text('En linea avatar') : Text('En linea $user'),
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextFormField(
                        onChanged: (value) {
                          textForm = value;
                          setState(() {});
                        },
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: ElevatedButton(
                      onPressed: () {
                        
                        FocusScope.of(context).unfocus();

                        final service = PostNotification();
                        listTiles.add(textForm);
                        // mapTiles.addEntries(newEntries)

                        mapTiles["user"] = textForm;
                        setState(() {
                          
                        });
                        service.sendData(
                            nombres: user,
                            mensaje: textForm,
                            token: token,
                            keyFirebase: keyFirebase);

                        _formKey.currentState?.reset();
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xff00ff40)),
                      child: Text('Enviar mensaje'),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 12.0, left: 12.0, bottom: 30.0, top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white30,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: 
                  ListView.builder(
                    itemCount: mapTiles.length,
                    itemBuilder: (BuildContext context, index) {
                      String key = mapTiles.keys.elementAt(index);
                      return key=='' ?  ListTile(
                        title:
                         Text("${mapTiles[key]}"), 
                        tileColor: Colors.green,
                      ): ListTile(
                        title:
                         Text("${mapTiles[key]}"), 
                        tileColor: Colors.red,
                      );
                    },
              
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        onPressed: () async {
          String respuestaQR = await FlutterBarcodeScanner.scanBarcode(
              '#2b778c', 'cancel', false, ScanMode.QR);

          Map respuestaQRJson = json.decode(respuestaQR);
          token = respuestaQRJson['token'];
          keyFirebase = respuestaQRJson['key'];
          user = respuestaQRJson['usuario'];

          // MessageStream _messageStream = MessageStream();

          // _messageStream.addToken(token);
          // _messageStream.addKeyFirebase(keyFirebase);
          // _messageStream.addName(user);
          setState(() {});

          print(token + keyFirebase + user);
        },
        child: Icon(Icons.filter_center_focus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  // List<Widget> _mensajes(){

  //   List<Widget> lst = [];

  //   listTiles.forEach((element) {
      
  //     Widget texto = Container(
  //         color: Colors.red,
  //         padding: EdgeInsets.all(8.0),
  //         child: Text(element, style: TextStyle(color: Colors.white),),
  //       );
  //       lst.add(texto);
      

  //   });

  //   return lst;

  // }

  // Widget _contenidoMensajes(){

  //   return Container(
  //     height: MediaQuery.of(context).size.height * 0.65,
  //     width: MediaQuery.of(context).size.width * 0.9,
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: Colors.black,
  //         width: 1,
  //       ),
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: ListView(
  //         children: _mensajes(),
  //       ),
  //     )
  //   );

  // }
}
