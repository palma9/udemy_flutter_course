import 'package:e6_userpreferences/src/utils/local_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final _prefs = new LocalStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Theme Color: ${_prefs.secondary ? 'Secondary' : 'Primary'}'),
        Divider(),
        Text('Gender: ${_prefs.gender == 1 ? 'Male' : 'Female' }'),
        Divider(),
        Text('Username: ${_prefs.username}'),
        Divider(),
      ],
    );
  }
}