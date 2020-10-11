import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function press;
  final String text;
  Answer(this.press, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.blueGrey,
        textColor: Colors.white,
        child: Text(text),
        onPressed: press,
      ),
    );
  }
}
