import 'package:flutter/material.dart';
import 'package:mvc_example/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MVC Example APP",
      home: MyView(),
    );
  }
}



