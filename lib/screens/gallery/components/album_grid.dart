import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:photo_gallery/photo_gallery.dart';
import './album_page.dart';

class AlbumGrid extends StatelessWidget {
  final Album album;
  const AlbumGrid({
    Key key,
    @required this.gridWidth,
    @required this.album,
  }) : super(key: key);

  final double gridWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AlbumPage(
            album: album,
          ),
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
