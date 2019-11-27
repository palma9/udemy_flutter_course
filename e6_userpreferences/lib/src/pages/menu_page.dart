import 'package:e6_userpreferences/src/routes/routes.dart';
import 'package:e6_userpreferences/src/utils/local_storage.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  
  static final _prefs = new LocalStorage();
  Widget selectedPage = getMenuRoutes()[_prefs.lastPage];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'), 
        backgroundColor: (_prefs.secondary) ? Colors.teal : Colors.blue),
      drawer: _makeMenu(context),
      body: selectedPage,
    );
  }

   Drawer _makeMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/menu-img.jpg'), fit: BoxFit.cover) 
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Pages'),
            onTap: () => changeMenuPage(context, 'home'),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () => changeMenuPage(context, 'settings'),
          ),
        ],
      )
    );
  }

  changeMenuPage(BuildContext context, String selection) {
    Navigator.pop(context);
    _prefs.lastPage = selection;
    selectedPage = getMenuRoutes()[selection];
    setState(() {});
  }

}