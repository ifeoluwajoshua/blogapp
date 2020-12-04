import 'package:blogapp/src/views/authy.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog app',
      theme: ThemeData(
       
        primarySwatch: Colors.orange,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthyScreen()
    );
  }
}
