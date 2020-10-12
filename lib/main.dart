import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
  var _totalScore = 0;
  static var _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "White", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Black", "score": 8},
        {"text": "Pink", "score": 2},
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 8},
        {"text": "Cat", "score": 2},
        {"text": "Lion", "score": 10},
        {"text": "Elephant", "score": 5},
      ]
    },
    {
      "questionText": "What's your favorite anime?",
      "answers": [
        {"text": "Naruto", "score": 10},
        {"text": "Boruto", "score": 8},
        {"text": "Dragon Ball Z", "score": 5},
        {"text": "One piece", "score": 2},
      ]
    }
  ];

  void _answerQuestion(score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('You have more questions');
    }
  }

  void _resetIndex() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
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
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              questionIndex: _questionIndex,
              answerQuestion: _answerQuestion,
            )
          : Result(
              score: _totalScore,
              press: _resetIndex,
            ),
    ));
  }
}
