import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
              backgroundColor: Colors.greenAccent,
            ),
            // we can use Row also if we want
            body: Column(
              children: <Widget>[
                Text('The Question is !'),
                RaisedButton(child: Text("Ans 1"), onPressed: null),
                RaisedButton(child: Text("Ans 2"), onPressed: null),
                RaisedButton(child: Text("Ans 3"), onPressed: null),
              ],
            )));
  }
}
