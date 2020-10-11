import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void answerQuestion() {
    print('Answer Chosen!');
  }

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
                // passing pointer instead function to onPressed
                RaisedButton(child: Text("Ans 1"), onPressed: answerQuestion),
                RaisedButton(child: Text("Ans 2"), onPressed: answerQuestion),
                RaisedButton(child: Text("Ans 3"), onPressed: answerQuestion),
              ],
            )));
  }
}
