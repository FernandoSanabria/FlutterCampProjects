import 'package:ejerciciologin/bloc/login_bloc.dart';
import 'package:ejerciciologin/bloc/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        body: Stack(
          children: [fondoRojo(), login(context)],
        ));
  }

  Widget fondoRojo() {
    final size = MediaQuery.of(context).size;

    final cabecera = Container(
      height: size.height * 0.4,
      width: size.width,
      color: Colors.red,
    );

    final titulo = Container(
      margin: EdgeInsets.only(
        top: 110,
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Login Personal Soft',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );

    return Stack(
      children: [cabecera, titulo],
    );
  }

  Widget login(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 200.0,
          )),
          Container(
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('Ingresa'),
                  email(bloc),
                  SizedBox(
                    height: 20.0,
                  ),
                  password(bloc),
                  SizedBox(
                    height: 20.0,
                  ),
                  button()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget email(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      return TextField(
      
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Colors.red,
          ),
          labelText: 'Email',
          hintText: 'Email',
          errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
    );
    });
  }

  Widget password(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return TextField(
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Colors.red),
          labelText: 'Contraseña',
          hintText: 'Contraseña',
          counterText: snapshot.data,
          errorText: snapshot.error
        ),
        onChanged: bloc.changePassword,
      );
    });
  }

  Widget button() {
    return RaisedButton(
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.red,
        onPressed: () {});
  }
}
