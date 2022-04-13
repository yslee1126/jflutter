import 'package:flutter/material.dart';
import 'package:jflutter/cards/postcard.dart';

import '../dto/content.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

Future<List<Content>> fetchContents() async {
  final response = await http.get(
      Uri.parse('https://api-hey.news.co.kr/opi/home_content?page_size=12&last_row_id=2022040800852643')
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if(response.statusCode == 200){
    return (jsonDecode(response.body) as List)
        .map((e) => Content.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Content>> contents;

  @override
  initState() {
    super.initState();
    contents = fetchContents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.separated(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index){
        return PostCard(
            contentId : index
        );
      },
      separatorBuilder: (BuildContext context, int index){
        return SizedBox(height: 10,);
      },
    ),);
  }

}