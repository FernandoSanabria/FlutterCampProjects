// import 'dart:async';

// StreamController<String> streamController = new StreamController.broadcast();   //Add .broadcast here

// @override
// void initState() {
//   super.initState();

//   print("Creating a StreamController...");
//   //First subscription
//   streamController.stream.listen((data) {
//     print("DataReceived1: " + data);
//   }, onDone: () {
//     print("Task Done1");
//   }, onError: (error) {
//     print("Some Error1");
//   });
//   //Second subscription
//   streamController.stream.listen((data) {
//     print("DataReceived2: " + data);
//   }, onDone: () {
//     print("Task Done2");
//   }, onError: (error) {
//     print("Some Error2");
//   });

//   streamController.add("This a test data");
//   print("code controller is here");

// }