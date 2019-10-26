import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:e2_components/src/routes/routes.dart';


void main() => runApp(MyApp());

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'EN'), // English
        const Locale('es', 'ES') // Spanish
      ],
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) => get404ErrorPage(settings),
    );
  }
}