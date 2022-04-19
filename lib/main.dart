import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';


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
  int stateTab = 0;
  dynamic data = [];

  //get http (async-await를 사용하기위해 getData함수에 담아줌)
  getData() async {
    dynamic result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    // print(result.body);

    // if (result.statusCode == 200) {
    //   print('성공');
    // } else {
    //   print('실패');
    // }

    // //map(key-val)으로 파싱
    // print(jsonDecode(result.body));
    data = jsonDecode(result.body);
  }
  //initState - getData() 함수 사용
  @override
  void initState() {
    super.initState();
    getData();
  }

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
      //Home자식위젯에 data를 넣어줌
      body: [Home(data : data), Text('샵페이지')][stateTab],
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

class Home extends StatelessWidget {
  //this.data로 사용선언
  const Home({Key? key, this.data}) : super(key: key);
  //부모객체에서 받아온 data
  final data;
  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      print(data);
      return ListView.builder(itemCount: 3, itemBuilder: (c, i){
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg'),
              Text('좋아요'),
              Text('글쓴이'),
              Text(data[i]['content']),
            ]
        );
      });
    } else {
      return Text('로딩중.,...');
    }
  }
}