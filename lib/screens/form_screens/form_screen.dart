import 'package:flutter/material.dart';
import 'package:learn_flutter_app/components/form_input_field.dart';
import 'package:learn_flutter_app/components/form_password_field.dart';
import 'package:learn_flutter_app/components/rounded_button.dart';
import 'package:learn_flutter_app/screens/form_screens/form_value_screen.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _password;
  String _phone;
  Map _formData;
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
              _buildEmail(),
              _buildPassword(),
              _buildPhone(),
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
      keyBoardType: TextInputType.name,
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
      keyBoardType: TextInputType.emailAddress,
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

  Widget _buildPhone() {
    return FormInputField(
      label: "Contact",
      keyBoardType: TextInputType.phone,
      validaror: (String val) {
        if (val.isEmpty) {
          return 'Contact is required';
        }
        return null;
      },
      onSaved: (String val) {
        _phone = val;
      },
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _formData = {
          "name": _name,
          "email": _email,
          "password": _password,
          "Contact": _phone
        };
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return FormValueScreen(_formData);
          },
        ),
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
    print('Form Data $_formData');
  }
}
