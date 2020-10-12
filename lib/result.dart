import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function press;

  const Result({Key key, this.score, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Your score is : ',
            style: TextStyle(color: Colors.redAccent, fontSize: 24)),
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
