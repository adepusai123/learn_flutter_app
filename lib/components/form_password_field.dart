import 'package:flutter/material.dart';

class FormPasswordField extends StatefulWidget {
  final String label;
  final Function validator;
  final Function onSaved;

  const FormPasswordField({
    Key key,
    this.label = "Password",
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  _FormPasswordFieldState createState() => _FormPasswordFieldState();
}

class _FormPasswordFieldState extends State<FormPasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
          obscureText: _showPassword,
          decoration: InputDecoration(
            labelText: "Password",
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child:
                  Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          validator: widget.validator,
          onSaved: widget.onSaved),
    );
  }
}
