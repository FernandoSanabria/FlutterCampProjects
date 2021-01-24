import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               firstElements(),
                      SizedBox(
                        height: 10,
                      ),
                      secondElement(),
                      SizedBox(
                        height: 10,
                      ),
                      thirdElement()
              ],
            ),
          )),
    );
  }

  Widget firstElements() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('button1'),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.green,
          textColor: Colors.white,
          child: Text('button2'),
        )
      ],
    );
  }

  Widget secondElement() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,

      children: [
        RaisedButton(
          onPressed: () {},
          color: Colors.blueAccent,
          textColor: Colors.white,
          child: Text('button1'),
        ),
      ],
    );
  }

  Widget thirdElement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {},
          color: Colors.red,
          textColor: Colors.white,
          child: Text('button4'),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('button5'),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.amber,
          textColor: Colors.white,
          child: Text('button6'),
        ),
      ],
    );
  }
}
