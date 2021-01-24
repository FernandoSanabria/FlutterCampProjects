import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  _ContadorPage createState() => _ContadorPage();
}

class _ContadorPage extends State<ContadorPage> {
  final estilos = new TextStyle(fontSize: 40.5);

  int _valor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titulo'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Cantidad de tabs",
              style: estilos,
            ),
            Text("$_valor",
                style: TextStyle(
                  fontSize: 30.5,
                )),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     _valor++;
      //     setState(() {
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),

      // floatingActionButton: Stack(
      //   children: <Widget>[
      //     Positioned(
      //       bottom: 80.0,
      //       right: 10.0,
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           _valor++;
      //           setState(() {});
      //         },
      //         child: Icon(Icons.add),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 30.0,
      //       right: 30.0,
      // child: FloatingActionButton(
      //   onPressed: () {
      //     _valor--;
      //     setState(() {});
      //   },
      //         child: Icon(Icons.delete),
      //       ),
      //     )
      //   ],
      // ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _crearBotones(),
      ),
    );
  }

  Row _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      
      children: <Widget>[
        FloatingActionButton(
          
          onPressed: () {
            _valor--;
            setState(() {});
          },
          child: Icon(Icons.remove),

        ),
        SizedBox(width: 5.0 ),
        FloatingActionButton(
          onPressed: () {
            _valor++;
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        SizedBox(width: 5.0 ),
        FloatingActionButton(
            onPressed: () {
              _valor = 0;
              setState(() {});
            },
            child: Icon(Icons.refresh))
      ],
    );
  }
}
