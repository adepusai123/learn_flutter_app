import 'package:flutter/material.dart';
import 'package:learn_flutter_app/components/rounded_button.dart';

class Answer extends StatelessWidget {
  final Function press;
  final String text;
  Answer(this.press, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RoundButton(
        color: Colors.amberAccent,
        textColor: Colors.black,
        btnLabel: text,
        press: press,
      ),
    );
  }
}
