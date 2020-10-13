import 'package:flutter/material.dart';

class ReadOnlyData extends StatelessWidget {
  final String label;
  final Color color;
  const ReadOnlyData({
    Key key,
    this.label,
    this.color = Colors.deepOrange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 24,
        ),
      ),
    );
  }
}
