import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

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
  static var questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": ["White", "Red", "Black"]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Dog", "Cat", "Lion"]
    },
    {
      "questionText": "What's your favorite anime?",
      "answers": ["Naruto", "Boruto", "DragonBall Z"]
    }
  ];
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
      print('You have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
              backgroundColor: Colors.blueGrey,
            ),
            // we can use Row also if we want
            body: _questionIndex < questions.length
                ? Column(
                    children: <Widget>[
                      Question(questions[_questionIndex]['questionText']),
                      // passing pointer instead function to onPressed
                      ...(questions[_questionIndex]['answers'] as List<String>)
                          .map((answer) {
                        return Answer(_answerQuestion, answer);
                      }).toList(),
                      RaisedButton(
                          child: Text("Clear State"),
                          onPressed: () {
                            setState(() {
                              _questionIndex = 0;
                            });
                          }),
                    ],
                  )
                : Center(
                    child: Text('You did it',
                        style: TextStyle(color: Colors.redAccent)),
                  )));
  }
}
