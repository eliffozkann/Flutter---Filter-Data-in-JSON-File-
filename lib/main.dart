import 'package:flutter/material.dart';
import 'package:json_detail_page/HayvanDetay.dart';
import 'package:json_detail_page/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hayvanlar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(),
      routes: {'HayvanlarDetay': (context) => HayvanDetay()},
    );
  }
}
