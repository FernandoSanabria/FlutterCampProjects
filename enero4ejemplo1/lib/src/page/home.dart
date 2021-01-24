import 'package:enero4ejemplo1/src/page/opt1.dart';
import 'package:enero4ejemplo1/src/page/opt2.dart';
import 'package:enero4ejemplo1/src/provider/provider_status.dart';
import 'package:enero4ejemplo1/src/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _Body(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.filter_center_focus),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final changedStatus = Provider.of<ProviderStatus>(context);
    final opcionSeleccionada = changedStatus.opcionSeleccionada;

    switch (opcionSeleccionada) {
      case 0:
        return Opt1();
        break;
      case 1:
        return Opt2();
        break;
      default:
        return Opt1();
    }
  }
}
