import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function press;

  String get resultPhrase {
    var resultText = 'You did it';
    if (score >= 15 && score <= 20) {
      resultText = "You are good and score is: ";
    } else if (score >= 20 && score <= 30) {
      resultText = "You are awesome and score is: ";
    } else {
      resultText = "You are so bad and score is: ";
    }
    return resultText;
  }

  const Result({Key key, this.score, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(resultPhrase,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        Text('$score',
            style: TextStyle(
                color: Colors.green,
                fontSize: 36,
                fontWeight: FontWeight.bold)),
        RaisedButton(child: Text("Go To Question"), onPressed: press)
      ],
    ));
  }
}
