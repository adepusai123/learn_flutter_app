import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String label;
  final Function validaror;
  final Function onSaved;

  const FormInputField({
    Key key,
    this.label,
    this.validaror,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5),
      // decoration: BoxDecoration(
      //     color: Colors.orangeAccent, borderRadius: BorderRadius.circular(29)),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.name,
        validator: validaror,
        onSaved: onSaved,
      ),
    );
  }
}
