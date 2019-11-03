import 'package:flutter/material.dart';
 
import 'package:e3_movies/src/routes/routes.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      routes: getAppRoutes(),
    );
  }

}
// 119