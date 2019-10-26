import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {
  
  final options = ['First', 'Second', 'Third', 'Fourth', 'Fifth'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: _createItems(),
      ),
    );
  }

  List<Widget> _createItems() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Subtitle of $item'),
            leading: Icon(Icons.android), // It will be at the beginning of tile
            trailing: Icon(Icons.keyboard_arrow_right), // At the end of tile
            onTap: () {}, // Action on click
          ),
          Divider(),
        ],
      );
    }).toList(); // Parse iterable to list
  }

  // List<Widget> _createItems() {
  //   List<Widget> list = new List<Widget>();
    
  //   for (var opt in options) {
      
  //     final tempWidget = ListTile(title: Text(opt));

  //     list..add(tempWidget)
  //         ..add(Divider());

  //   }

  //   return list;
  // }

}