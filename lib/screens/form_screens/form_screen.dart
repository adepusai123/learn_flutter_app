import 'package:flutter/material.dart';
import 'package:learn_flutter_app/components/form_input_field.dart';
import 'package:learn_flutter_app/components/form_password_field.dart';
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
  bool _showPassword = true;

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
              _buildEmail(),
              _buildPassword(),
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
    return FormInputField(
      label: "Name",
      validaror: (String val) {
        if (val.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String val) {
        _name = val;
      },
    );
  }

  Widget _buildEmail() {
    return FormInputField(
      label: "Email",
      validaror: (String val) {
        final expr =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        if (val.isEmpty) {
          return "Email is required";
        }
        if (!RegExp(expr).hasMatch(val)) {
          return "Enter valid email.";
        }
        return null;
      },
      onSaved: (String val) {
        _email = val;
      },
    );
  }

  Widget _buildPassword() {
    return FormPasswordField(
      validator: (String password) {
        if (password.isEmpty) {
          return "Password is required";
        }
        return null;
      },
      onSaved: (String password) {
        _password = password;
      },
    );
  }

  void _validateInputs() {
    print('Name: $_name  Email: $_email');
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
