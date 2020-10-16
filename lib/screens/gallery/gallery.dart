import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

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

class AlbumGrid extends StatelessWidget {
  final Album album;
  const AlbumGrid({
    Key key,
    @required this.gridWidth,
    this.album,
  }) : super(key: key);

  final double gridWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Container(),
        ),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            child: Container(
              color: Colors.grey[300],
              height: gridWidth,
              width: gridWidth,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: AlbumThumbnailProvider(
                  albumId: album.id,
                  mediumType: album.mediumType,
                  highQuality: true,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 2),
            child: Text(
              album.name,
              maxLines: 1,
              textAlign: TextAlign.start,
              style: TextStyle(
                height: 1.2,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
