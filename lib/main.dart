import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var questionIndex = 0;
  void answerQuestion() {
    questionIndex += 1;
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite Color?",
      "What's your favorite animal?"
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
              backgroundColor: Colors.greenAccent,
            ),
            // we can use Row also if we want
            body: Column(
              children: <Widget>[
                Text(questions[questionIndex]),
                // passing pointer instead function to onPressed
                RaisedButton(
                  child: Text("Ans 1"),
                  onPressed: () => print("One line print"),
                ),
                RaisedButton(child: Text("Ans 2"), onPressed: answerQuestion),
                RaisedButton(child: Text("Ans 3"), onPressed: answerQuestion),
              ],
            )));
  }
}
