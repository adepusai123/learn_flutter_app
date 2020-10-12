import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My Sample App'),
        backgroundColor: Colors.blueGrey,
      ),
      // we can use Row also if we want
      body: WelcomeScreen(),
    ));
  }
}
