import 'dart:convert';
// import 'dart:html';
// import 'dart:io';

import 'package:ejerciciologin/preferences/preferences_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';

class Service {
  var imageLoadUrl = '';

  Future<Map<String, dynamic>> login(String email, String password) async {
    print(email);
    print(password);

    final url = "https://biolab.ga/biolab-api/oauth/token";
    final urlUsuarioInfo =
        "https://biolab.ga/biolab-api/api/usuarios/obtener-info-usuario-autenticado";

    final preferences = new PreferencesUser();
    final data = {
      'username': email,
      'password': password,
      'grant_type': 'password',
      'client_id': 'spring-security-oauth2-read-write-client'
    };

    final res = await http.post(url, body: data, headers: {
      'Authorization':
          'Basic c3ByaW5nLXNlY3VyaXR5LW9hdXRoMi1yZWFkLXdyaXRlLWNsaWVudDpzcHJpbmctc2VjdXJpdHktb2F1dGgyLXJlYWQtd3JpdGUtY2xpZW50LXBhc3N3b3JkMTIzNA=='
    });

    Map<String, dynamic> resDecode = json.decode(res.body);

    preferences.token = resDecode['access_token'];

    if (resDecode.containsKey('access_token')) {
      return {'ok': true, 'token': resDecode['access_token']};
    } else {
      return {'ok': false, 'mensaje': resDecode['error_description']};
    }

    // final resUserInfo = await http.get(urlUsuarioInfo, headers: {
    //   'Authorization':
    //       'Bearer 06b36b2c-f0fd-4809-a046-fdadedc70d1a'
    // });

    // Map<String, dynamic> resDecode = json.decode(res.body);

// print('decode response');
//  print(resDecode);
//  print('decode response values:' );
//  print(resDecode.values.toList());
//   print('decode response token:' );
//  print(resDecode.values.toList()[0]);

//     Map<String, dynamic> resDecodeUserInfo = json.decode(resUserInfo.body);

//     print(resDecodeUserInfo);
//     print('Entries');
//     print(resDecode.entries);
//     // print(resDecode);

//     print(res);
  }

  Future<String> uploadImage(PickedFile imagen) async {
    final url = Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/biolab-9b803.appspot.com/o?name=Upload/pruebaImg/601');
    final tipoImagen = mime(imagen.path).split('/');

    final subidaImagen = http.MultipartRequest('POST', url);

    final img = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(tipoImagen[0], tipoImagen[0]));

    subidaImagen.files.add(img);

    final peticion = await subidaImagen.send();

    final respuesta = await http.Response.fromStream(peticion);

    final response = json.decode(respuesta.body);

    final imgToken = response['downloadTokens'];

    print(json.decode(respuesta.body));

    imageLoadUrl =
        'https://firebasestorage.googleapis.com/v0/b/biolab-9b803.appspot.com/o/Upload%2FpruebaImg%2F600?alt=media&token=${imgToken}';

    return imageLoadUrl;
  }

  Future<String> uploadFile(imagen) async {
    final url = Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/biolab-9b803.appspot.com/o?name=Upload/pruebaImg/650');
    final tipoImagen = mime(imagen.path).split('/');

    final subidaImagen = http.MultipartRequest('POST', url);

    final img = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(tipoImagen[0], tipoImagen[0]));

    subidaImagen.files.add(img);

    final peticion = await subidaImagen.send();

    final respuesta = await http.Response.fromStream(peticion);

    final response = json.decode(respuesta.body);

    final imgToken = response['downloadTokens'];

    print(json.decode(respuesta.body));

    imageLoadUrl =
        'https://firebasestorage.googleapis.com/v0/b/biolab-9b803.appspot.com/o/Upload%2FpruebaImg%2F650?alt=media&token=${imgToken}';

    return imageLoadUrl;
  }
}
