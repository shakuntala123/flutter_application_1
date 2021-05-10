import 'package:flutter/material.dart';

class HomeIconWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.playlist_add_rounded,
            color: Colors.orange,
            size: 70,
          ),
          Text('Playlist',
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
         Icon(
            Icons.play_arrow_sharp,
            color: Colors.orange,
            size: 70,
          ),
        ],
      ),
    );
  }
}
