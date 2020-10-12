import 'package:flutter/material.dart';
import 'package:learn_flutter_app/screens/form_screens/form_screen.dart';
import 'package:learn_flutter_app/screens/quiz_screens/quiz_screen.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundButton(
          btnLabel: 'Form Demo',
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FormScreen();
                },
              ),
            );
          },
        ),
        RoundButton(
          btnLabel: 'Quiz',
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return QuizScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
