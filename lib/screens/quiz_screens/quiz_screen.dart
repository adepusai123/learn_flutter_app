import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber,
        title: Text(
          "Quiz",
          style: TextStyle(color: Colors.black),
        ),
      ),
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
    );
  }
}
