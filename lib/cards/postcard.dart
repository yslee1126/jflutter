import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {

  int contentId;

  PostCard({required this.contentId});

  @override
  _PostCardState createState() => _PostCardState();

}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: Text('사진'),)
          ),
          Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Center(child: Text('제목'),)
          ),
          Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite_border), SizedBox(width: 7,), Icon(Icons.chat_outlined)
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }

}