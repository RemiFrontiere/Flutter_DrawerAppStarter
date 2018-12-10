import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Hello Page 1"),
    );
  }
}