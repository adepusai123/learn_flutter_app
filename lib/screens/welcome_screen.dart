import 'package:flutter/material.dart';
import './access_photos/access_photos.dart';
import '../components/permisson_list.dart';
import './form_screens/form_screen.dart';
import './photo_album/photo_album_screen.dart';
import './quiz_screens/quiz_screen.dart';
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
        RoundButton(
          btnLabel: 'Photo Album',
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PhotoAlbumScreen();
                },
              ),
            );
          },
        ),
        RoundButton(
          btnLabel: 'Permission List',
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PermissionListScreen();
                },
              ),
            );
          },
        ),
        RoundButton(
          btnLabel: 'Access Photos',
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AccessPhotos();
                },
              ),
            );
          },
        )
      ],
    );
  }
}
