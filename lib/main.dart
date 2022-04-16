import 'package:flutter/material.dart';
import './style.dart' as style;


void main() {
  runApp(
    //materialapp위젯 사용함 (option : title, theme, home)
    MaterialApp(
      //option
      //theme? css같은 역할
      theme: style.themeAppBar,
      home: MyApp()
    )
  );
}

//state사용
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var state = 0;

  @override
  Widget build(BuildContext context) {
    //scafflod 위젯 리턴
    return Scaffold(
      //appbar (네비바)
      appBar: AppBar(
          title: Text('R9Sgram'),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_box_outlined),
              iconSize: 30,
            ),
          ]),
      //본문에 text
      body: Text("hello"),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '설명 홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '설명 샵'),
        ],
      ),
    );
  }
}