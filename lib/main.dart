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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    );
  }
}