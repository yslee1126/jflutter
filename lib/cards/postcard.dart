import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {

  int number;

  PostCard({required this.number});

  @override
  _PostCardState createState() => _PostCardState();

}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blue,
      child: Center(child: Text(widget.number.toString()),),
    );
  }

}