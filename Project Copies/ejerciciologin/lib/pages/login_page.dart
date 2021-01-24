
import 'package:ejerciciologin/bloc/login_bloc.dart';
import 'package:ejerciciologin/bloc/provider.dart';
import 'package:ejerciciologin/preferences/preferences_user.dart';
import 'package:ejerciciologin/services/service.dart';
import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final servicio = new Service();
  String emailsillo = '';
  String passwordsillo = '';
  bool checkSelectionBox = false;
  final preferences = PreferencesUser();


  @override
  void initState() { 
    super.initState();
    emailsillo= preferences.lastEmail;
    passwordsillo = preferences.lastPassword;
    checkSelectionBox = preferences.lastCheckBox;
  }

  // LocalAuthentication localAuth;
  // bool isBiometricAvailable = false;

  // @override
  // void initState() {
  //   super.initState();
  //   localAuth = LocalAuthentication();
  //   localAuth.canCheckBiometrics.then((value) => {
  //         setState(() {
  //           isBiometricAvailable = value;
  //         })
  //       });
  // }

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
        top: 100,
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
                  Text('Log in'),
                  email(bloc),
                  SizedBox(
                    height: 20.0,
                  ),
                  password(bloc),
                  SizedBox(
                    height: 20.0,
                  ),
                  // fingerAuthentication(),
                  checkBox(),
                  button(context),
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
          return TextFormField(
            initialValue: preferences.lastEmail,
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
            onChanged: (value) {
              bloc.changeEmail;
              setState(() {
                emailsillo = value;
              });
            },
          );
        });
  }

  Widget password(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextFormField(
            initialValue: preferences.lastPassword,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.red),
                labelText: 'Contraseña',
                hintText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: (value) {
              bloc.changePassword;
              setState(() {
                passwordsillo = value;
              });
            },
          );
        });
  }

  // Widget fingerAuthentication() {
  //   return RaisedButton.icon(
  //     onPressed: () async{
  //         if(isBiometricAvailable){
  //           bool didAuthenticate = await localAuth.authenticateWithBiometrics(
  //             localizedReason:'Identifiquese civil!' ,
  //           );
  //         if(didAuthenticate)  {

  //         }

  //         }

  //      },
  //     label: Text('Ingresar con huella'),
  //    icon: Icon(Icons.fingerprint, color: Colors.white,),
  //    textColor: Colors.white,
  //    color: Colors.red,

  //   );
  // }

  Widget checkBox() {
    return CheckboxListTile(
        title: Text('Recordar credenciales'),
        value: preferences.lastCheckBox,
        onChanged: (value) {
          saveCredentials(value);
        });
  }

  void saveCredentials(value) {
    setState(() {
      checkSelectionBox = value;

      if (checkSelectionBox) {
        preferences.lastCheckBox = value;
        preferences.lastEmail = emailsillo;
        preferences.lastPassword = passwordsillo;
      } else {
        preferences.lastCheckBox = checkSelectionBox;
        preferences.lastEmail = '';
        preferences.lastPassword = '';
      }
    });
  }

  Widget button(BuildContext context) {
    return RaisedButton(
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.red,
        onPressed: () {
          request(context);
        });
  }

  void request(BuildContext context) async {
    Map info = await servicio.login(emailsillo, passwordsillo);
    print(info['ok']);

    if (info['ok']) {
      Navigator.pushNamed(context, 'home');
    } else {
      alerta(context);
    }
  }

  void alerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('El usuario y/0 contraseña ivalida'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
