import 'dart:async';

class Validaciones {
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, skin) {
    if (password.length > 6) {
      skin.add(password);
    } else {
      if (password.length > 0) {
        skin.addError('Ingrese mas de seis');
      } else {
        skin.add(password);
      }
    }
  });

 static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, skin) {
        if (isEmail(email)){
            skin.add(email);

           

        }else {
            skin.addError('Digita un correo valido');
        }
      });
}
