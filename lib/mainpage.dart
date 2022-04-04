import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(label: '홈', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: '좋아요', icon: Icon(Icons.favorite)),
    BottomNavigationBarItem(label: '설정', icon: Icon(Icons.settings)),
  ];

  List pages = [
    Container(child: Center(child: Text('메인페이지'),),),
    Container(child: Center(child: Text('좋아요한기사'),),),
    Container(child: Center(child: Text('설정'),),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Brand R&D'),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: bottomItems,),
      body: pages[_selectedIndex],
    );
  }

}