import 'package:flutter/material.dart';
import 'package:learn_flutter_app/components/rounded_button.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _password;
  String _phone;
  bool _autoValidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        width: double.infinity,
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            children: <Widget>[
              _buildName(),
              SizedBox(height: size.height * 0.02),
              RoundButton(
                btnLabel: "SUBMIT",
                color: Colors.deepOrange,
                press: _validateInputs,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(labelText: "Name"),
        keyboardType: TextInputType.name,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      ),
    );
  }

  void _validateInputs() {
    print(_name);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
