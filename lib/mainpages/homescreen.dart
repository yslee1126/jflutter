import 'package:flutter/material.dart';

import '../dto/content.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Content>> contents;

  @override
  initState() {
    super.initState();
    contents = fetchContents();
  }

  Future<List<Content>> fetchContents() async {
    final response = await http.get(Uri.parse(
        'https://api-hey.news.co.kr/opi/home_content?page_size=12&last_row_id=2022040800852643'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Content.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Content>>(
        future: contents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Content>? data = snapshot.data;
            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Center(
                              child: Image.network(data[index].thumbnail),
                            )),
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Center(
                              child: Text(data[index].title),
                            )),
                        Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(Icons.chat_outlined)
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
