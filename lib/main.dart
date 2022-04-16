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
  //tab의  state
  var stateTab = 0;

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
      //List형식으로 tab 보여줄것임 (if써도됨)
      body: [Text("메인페이지"), Text('샵페이지')][stateTab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //onTap .. i는 0,1,2... 순서대로 부여됨
        onTap: (i){
          //state를 바꿔주려면 setstate를 사용해야함
          setState(() {
            stateTab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '설명 홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '설명 샵'),
        ],
      ),
    );
  }
}