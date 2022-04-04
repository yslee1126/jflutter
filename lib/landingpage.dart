import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jflutter/mainpage.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();

}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 1), (){
        Get.offAll(MainPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body : Stack(
        alignment: Alignment.center,
        children: [
          Container(
              color: Colors.deepOrange,
              child: Center(child: Text("Brand R&D"))
          ),
          CircularProgressIndicator()
        ],
      )
    );
  }

}