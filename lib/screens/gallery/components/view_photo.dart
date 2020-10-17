import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class ViewPhoto extends StatefulWidget {
  final Medium medium;
  const ViewPhoto({Key key, this.medium}) : super(key: key);
  @override
  _ViewPhotoState createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  @override
  Widget build(BuildContext context) {
    final media = widget.medium;
    DateTime date = media.creationDate ?? media.modifiedDate;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(date?.toLocal().toString()),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: MemoryImage(kTransparentImage),
          image: PhotoProvider(
            mediumId: media.id,
          ),
        ),
      ),
    );
  }
}
