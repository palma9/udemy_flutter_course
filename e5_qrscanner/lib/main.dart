import 'package:e5_qrscanner/src/pages/home_page.dart';
import 'package:e5_qrscanner/src/pages/viewmap_page.dart';
import 'package:flutter/material.dart';
 

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRScanner',
      initialRoute: 'home',
      routes: {
        'home'    : (context) => HomePage(),
        'viewmap' : (context) => ViewmapPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent
      ),
    );
  }
}