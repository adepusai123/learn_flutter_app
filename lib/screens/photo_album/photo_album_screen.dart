import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoAlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: Icon(Icons.more_vert),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.PNG"),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "UnSplash",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Naruto Characters"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey,
                    hintText: "Search",
                    icon: Icon(Icons.search)),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(29)),
              ),
            ),
          ),
          SliverStaggeredGrid.countBuilder(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset("assets/images/$index.jpg"),
              );
            },
            itemCount: 9,
          )
        ],
      ),
    );
  }
}
