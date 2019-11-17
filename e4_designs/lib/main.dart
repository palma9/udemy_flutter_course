import 'package:flutter/material.dart';
 
import 'package:e4_designs/src/pages/basic_page.dart';
import 'package:e4_designs/src/pages/menu_page.dart';
import 'package:e4_designs/src/pages/scroll_page.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'scroll',
      routes: {
        'basic'   : (context) => BasicPage(),
        'menu'    : (context) => MenuPage(),
        'scroll'  : (context) => ScrollPage(),
      }
    );
  }
}