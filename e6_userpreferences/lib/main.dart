import 'package:e6_userpreferences/src/utils/local_storage.dart';
import 'package:flutter/material.dart';

import 'package:e6_userpreferences/src/routes/routes.dart';

void main() async {
  final _prefs = new LocalStorage();
  await _prefs.initPrefs();
  
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferences',
      routes: getAppRoutes()
    );
  }
}