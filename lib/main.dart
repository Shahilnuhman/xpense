import 'package:flutter/material.dart';
import 'package:xpens/screens/home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home:  ScreenHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
