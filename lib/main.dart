import './Drawer/drawer.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Starting App',
      theme: new ThemeData(
        primaryColor: Colors.blueGrey[900],
      ),
      home: new DrawerCustom(),
    );
  }
}
