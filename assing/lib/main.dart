// import 'dart:ffi';
import 'package:assing/listofusers.dart';
import 'package:assing/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Colors.black12,
      home: listofuser(),
    );
  }
}
