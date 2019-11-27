import 'package:e6_userpreferences/src/pages/home_page.dart';
import 'package:e6_userpreferences/src/pages/menu_page.dart';
import 'package:e6_userpreferences/src/pages/settings_page.dart';
import 'package:flutter/material.dart';



Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/'           : (context) => MenuPage(),
  };
}

Map<String, Widget> getMenuRoutes() {
  return {
    'home'        : HomePage(),
    'settings'    : SettingsPage(),
  };
}