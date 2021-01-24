import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home de rutas'),
        ),
        body: ListView(

          children: [
            ListTile(
              title: Text('Link Ruta A'),
              onTap: (){
                Navigator.pushNamed(context, 'rutaA');
              },
            
            ),

            ListTile(
              title: Text('Link Ruta B'),
              onTap: (){
                Navigator.pushNamed(context, 'rutaB');
              },
            )
          ],

        ),
    );
  }
}