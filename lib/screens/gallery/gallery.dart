import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import './components/album_grid.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Album> _albums;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    initAsync();
  }

  Future<void> initAsync() async {
    if (!await Permission.storage.status.isGranted) {
      await Permission.storage.request();
    }
    if (!await Permission.photos.request().isGranted) {
      await Permission.photos.request();
    }

    List<Album> albums =
        await PhotoGallery.listAlbums(mediumType: MediumType.image);
    setState(() {
      _albums = albums;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                double gridWidth = (constraints.maxWidth - 20) / 3;
                double gridHeight = gridWidth + 33;
                double ratio = gridWidth / gridHeight;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: ratio,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children: <Widget>[
                      ...?_albums?.map(
                        (album) => AlbumGrid(
                          gridWidth: gridWidth,
                          album: album,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
