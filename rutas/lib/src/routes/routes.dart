import 'package:flutter/material.dart';
import 'package:rutas/src/pages/home_page.dart';
import 'package:rutas/src/pages/ruta_a.dart';
import 'package:rutas/src/pages/ruta_b.dart';


Map<String, WidgetBuilder> generalRoutes(){
return <String, WidgetBuilder> {
  '/': (BuildContext context) => HomePage(),
  'rutaA': (BuildContext context) => RutaA(),
  'rutaB': (BuildContext context)  => RutaB()
};

}