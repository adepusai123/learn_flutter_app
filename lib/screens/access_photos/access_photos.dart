import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Photos',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: AccessPermission(),
    );
  }
}

class AccessPermission extends StatefulWidget {
  @override
  _AccessPermissionState createState() => _AccessPermissionState();
}

class _AccessPermissionState extends State<AccessPermission> {
  File _image;

  Future getImage(bool isCamera) async {
    File image;
    checkPermission();
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
  }

  Future checkPermission() async {
    var cPermission = Permission.camera;
    var sPermission = Permission.storage;
    if (await cPermission.status.isUndetermined) {
      await cPermission.request();
    }
    if (await sPermission.status.isUndetermined) {
      await sPermission.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _image == null
                ? Container(
                    child: Text('No Image selected'),
                  )
                : Image.file(_image,
                    height: size.height * 0.6, width: double.infinity * 0.9),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    getImage(false);
                  },
                  child: Text("Open Gallery"),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    getImage(true);
                  },
                  child: Text("Open Camera"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
