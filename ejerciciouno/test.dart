import 'package:flutter/material.dart';

class MultiFloatingButton extends StatefulWidget {
  @override
  _MultiFloatingButtonState createState() => _MultiFloatingButtonState();
}

class _MultiFloatingButtonState extends State<MultiFloatingButton> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Float'),
        centerTitle: true,
      ),
      body: Container(
        
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 80.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: 'save',
              onPressed: () {
                // What you want to do
              },
              child: Icon(Icons.save),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: 'close',
              onPressed: () {},
              child: Icon(Icons.close),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}