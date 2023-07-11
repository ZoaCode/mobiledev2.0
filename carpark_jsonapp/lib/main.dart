import 'package:flutter/material.dart';
import 'package:carpark_jsonapp/cp_jsonparser.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json Parse Demo',
      theme: ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
        body: CPJsonParse(),
      ),
    );
  }
}
