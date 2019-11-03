import 'package:e3_movies/src/pages/movie_detail.dart';
import 'package:flutter/material.dart';

import 'package:e3_movies/src/pages/home_page.dart';


Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/'           : (context) => HomePage(),
    'movie_detail': (context) => MovieDetail(),
  };
}