import 'package:e6_userpreferences/src/utils/local_storage.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  TextEditingController textController;

  final _prefs = new LocalStorage();

  @override
  void initState() {
    super.initState();
    textController = new TextEditingController(text: _prefs.username);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          child: Text('Settings', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
        ),
        
        Divider(),

        SwitchListTile(
          value: _prefs.secondary,
          title: Text('Secondary color'),
          onChanged: _setSecondaryColor,
        ),

        Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: RadioListTile(
                value: 1,
                title: Text('Male'),
                groupValue: _prefs.gender,
                onChanged: _setSelectedGender,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: RadioListTile(
                value: 2,
                title: Text('Female'),
                groupValue: _prefs.gender,
                onChanged: _setSelectedGender,
              ),
            ),
          ],
        ),

        Divider(),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(labelText: 'Username'),
            controller: textController,
            onChanged: _setName,
          ),
        ),
      ],
    );
  }

  _setSecondaryColor(bool value) {
    _prefs.secondary = value;
    setState(() {});
  }

  _setSelectedGender(int value) {
    _prefs.gender = value;
    setState(() {});
  }

  _setName(String value) {
    _prefs.username = value;
    setState(() {});
  }
}