import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: _avatars(),
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.carseywolf.ucsb.edu/wp-content/uploads/2017/09/default-avatar.png'),
          placeholder: AssetImage('data/img/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),

        ),
      ),
    );
  }
  
  List<Widget> _avatars() {
    return <Widget>[
      Container(
        padding: EdgeInsets.all(7),
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://www.carseywolf.ucsb.edu/wp-content/uploads/2017/09/default-avatar.png'),
          radius: 20,
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 10),
        child: CircleAvatar(
          child: Text('SL'),
          backgroundColor: Colors.deepPurple,
        ),
      ),
    ];
  }

}