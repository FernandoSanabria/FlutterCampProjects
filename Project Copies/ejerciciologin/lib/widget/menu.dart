import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.account_balance,
                size: 90.0,
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Multimedia'),
              leading: Icon(Icons.mediation),
              onTap: () {
                Navigator.pushNamed(context, 'multimedia');
              },
            ),
            ListTile(
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pushNamed(context, 'login');
              },
            ),
          ],
        ),
      );
  }
}