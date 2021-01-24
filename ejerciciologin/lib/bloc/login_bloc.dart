import 'dart:async';

import 'package:ejerciciologin/bloc/validaciones.dart';

class LoginBloc with Validaciones{


  final _passwordController = StreamController<String>.broadcast();
  final _emailController = StreamController<String>.broadcast();

  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);


  Function (String) get changePassword => _passwordController.sink.add;

  Function (String ) get changeEmail => _emailController.sink.add;


  dispose(){
    _passwordController.close();

    _emailController.close();

  }

}