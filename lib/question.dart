import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;
  Question(this.questionText); // this is a constructor
  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
