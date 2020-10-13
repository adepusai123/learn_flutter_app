import 'package:flutter/material.dart';
import 'package:learn_flutter_app/screens/form_screens/read_only.dart';

class FormValueScreen extends StatelessWidget {
  final Map formData;
  FormValueScreen(this.formData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Data"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ReadOnlyData(
                    label: formData.keys.elementAt(0),
                  ),
                  ReadOnlyData(
                    color: Colors.black,
                    label: formData.values.elementAt(0),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ReadOnlyData(
                    label: formData.keys.elementAt(1),
                  ),
                  ReadOnlyData(
                    color: Colors.black,
                    label: formData.values.elementAt(1),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ReadOnlyData(
                    label: formData.keys.elementAt(2),
                  ),
                  ReadOnlyData(
                    color: Colors.black,
                    label: formData.values.elementAt(2),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ReadOnlyData(
                    label: formData.keys.elementAt(3),
                  ),
                  ReadOnlyData(
                    color: Colors.black,
                    label: formData.values.elementAt(3),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
