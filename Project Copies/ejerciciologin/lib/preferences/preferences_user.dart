import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  
static final PreferencesUser _instance = new PreferencesUser.internal();

PreferencesUser.internal();


factory PreferencesUser () {
  return _instance;
}


SharedPreferences _preferences;


initPreferences() async{
  this._preferences = await SharedPreferences.getInstance();
}

get token {
  return _preferences.getString('token') ?? '';
}

set token (String value) {
   _preferences.setString('token', value);
}



get lastPage {
  return _preferences.getString('lastPage') ?? 'login';
}

set lastPage (String value) {
   _preferences.setString('lastPage', value);
}


get lastEmail {
  return _preferences.getString('lastEmail') ?? '';
}


set lastEmail (String value) {
   _preferences.setString('lastEmail', value);
}

set lastPassword (String value) {
   _preferences.setString('lastPassword', value);
}

get lastPassword {
  return _preferences.getString('lastPassword') ?? '';
}


set lastCheckBox (bool value) {
   _preferences.setBool('lastCheckBox', value);
}

get lastCheckBox {
  return _preferences.getBool('lastCheckBox') ?? false;
}


}