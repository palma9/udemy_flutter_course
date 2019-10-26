import 'package:flutter/material.dart';

import 'package:e2_components/src/pages/404_page.dart';
import 'package:e2_components/src/pages/animated_container.dart';
import 'package:e2_components/src/pages/alert_page.dart';
import 'package:e2_components/src/pages/avatar_page.dart';
import 'package:e2_components/src/pages/card_page.dart';
import 'package:e2_components/src/pages/home_page.dart';
import 'package:e2_components/src/pages/input_page.dart';
import 'package:e2_components/src/pages/listview_page.dart';
import 'package:e2_components/src/pages/slider_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
      '/'                 : (context) => HomePage(),
      'alert'             : (context) => AlertPage(),
      'avatar'            : (context) => AvatarPage(),
      'card'              : (context) => CardPage(),
      'animated_container': (context) => AnimatedContainerPage(),
      'input'             : (context) => InputPage(),
      'slider'            : (context) => SliderPage(),
      'list'              : (context) => ListViewPage(),
  };
}


Route<dynamic> get404ErrorPage(settings) {
  return MaterialPageRoute(
    builder: (context) => Page404(),
  );
}
