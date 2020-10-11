import 'package:flutter/material.dart';
import 'package:learn_flutter_app/question.dart';

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
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
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
                Question(questions[_questionIndex]),
                // passing pointer instead function to onPressed
                RaisedButton(child: Text("Ans 1"), onPressed: _answerQuestion),
                RaisedButton(child: Text("Ans 2"), onPressed: _answerQuestion),
                RaisedButton(child: Text("Ans 3"), onPressed: _answerQuestion),
                RaisedButton(
                    child: Text("Clear State"),
                    onPressed: () {
                      setState(() {
                        _questionIndex = 0;
                      });
                    }),
              ],
            )));
  }
}
