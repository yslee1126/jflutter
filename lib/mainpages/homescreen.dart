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
  ScrollController _scrollController = ScrollController();
  int lastContentId = 0;

  @override
  initState() {
    super.initState();
    contents = fetchContents();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          print('bottom' + lastContentId.toString());
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Content>> fetchContents() async {
    String url = 'https://api-hey.news.co.kr/opi/home_content?page_size=12';
    if (lastContentId > 0) {
      url = url + '&last_row_id=' + lastContentId.toString();
    }
    final response = await http.get(Uri.parse(url));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List<Content> result = (jsonDecode(response.body) as List)
          .map((e) => Content.fromJson(e))
          .toList();
      if (result.last.contentId > 0) {
        lastContentId = result.last.contentId;
      }
      return result;
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
                controller: _scrollController,
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
