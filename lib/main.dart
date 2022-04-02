// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brand R&D',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Brand R&D'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            final randomNum = Random().nextInt(100) + 1;
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
            _suggestions.add('기사번호' + randomNum.toString()); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String txt) {
    return ListTile(
      title: Text(
        txt,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}