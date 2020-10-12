import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String btnLabel;
  final Function press;
  final Color color;
  final Color textColor;
  const RoundButton({
    Key key,
    this.btnLabel,
    this.press,
    this.color = Colors.blueGrey,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          child: Text(
            btnLabel,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: press,
        ),
      ),
    );
  }
}
