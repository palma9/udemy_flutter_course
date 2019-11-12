import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _topImage(_screenSize),
            _title(),
            _actions(),
            _description(),
          ]
        ),
      ),
    );
  }

  Widget _topImage(Size _screenSize) {
    return Container(
      width: double.infinity,
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/img/loading.gif',
        image: 'https://hollanderdesign.com/app/uploads/2014/12/haven-meadows-2048x1366.jpg',
        fit: BoxFit.cover,
        height: _screenSize.height*0.35,
      ),
    );
  }

  Widget _title() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Pradera con arboles',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                SizedBox(height: 7),
                Text('Una pradera que se encuentra a saber donde',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.red, size: 30),
                Text('47', style: TextStyle(fontSize: 20))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _actions() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _actionItem(Icons.call, 'CALL'),
            _actionItem(Icons.place, 'ROUTE'),
            _actionItem(Icons.share, 'SHARE'),
          ],
        ),
      ),
    );
  }

  Widget _actionItem(IconData icon, String text) {
    final _textStyle = TextStyle(
      color: Colors.blue, 
      fontWeight: FontWeight.bold,
      fontSize: 14
    );
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 32),
        Text(text, style: _textStyle),
      ],
    );
  }

  Widget _description() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In hendrerit vitae augue at varius. Sed auctor egestas leo, laoreet pharetra dolor. Vestibulum tincidunt felis id cursus imperdiet. Nullam blandit risus convallis cursus ultricies. Integer aliquet est elit, in posuere mauris consectetur vel. Vivamus sagittis in mi sit amet faucibus.\n\nNullam porttitor, ante porta aliquet mattis, velit tortor sollicitudin felis, eu sagittis sapien est ut nunc. Aliquam a sem aliquet, dignissim lectus et, consectetur augue. Etiam quis lorem a magna aliquet porta. Nunc id pellentesque mauris. Morbi sed ultrices justo. Aliquam vestibulum gravida aliquet. Proin commodo augue eget nisl cursus, non sagittis nisl suscipit. In hac habitasse platea dictumst. Duis metus lacus, auctor vitae quam vitae, blandit mattis sem.\n\nQuisque tempus porta odio id aliquet. Vestibulum ligula nisl, congue vel justo nec, hendrerit vulputate libero. Aliquam fermentum congue augue pretium semper. Curabitur in ultricies nulla, at eleifend justo. Nunc eget efficitur neque. Etiam vitae aliquam tortor. Morbi tempor suscipit mi, a bibendum nibh semper et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam gravida erat in enim congue volutpat.',
          textAlign: TextAlign.justify,
          ),
      ),
    );
  }

}