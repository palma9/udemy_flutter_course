import 'dart:math';
import 'dart:ui' as prefix0;
import 'dart:ui';

import 'package:flutter/material.dart';


class MenuPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      body: Stack(
        children: <Widget>[
          _background(),
          SingleChildScrollView(child: Column(children: <Widget>[
            _titles(),
            _menuButtons(),
          ])),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1))
        )
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            title: Container(),
          ),
        ],
      ),
    );
  }

  Widget _background() {
    
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(52, 54, 101, 1), Color.fromRGBO(35, 37, 57, 1)],
          begin: FractionalOffset(0, 0.6),
          end: FractionalOffset(0, 1)
        )
      ),
    );

    final bgBox = Transform.rotate(
      angle: -pi / 5,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(160, 40, 190, 1), 
              Color.fromRGBO(221, 100, 182, 1)
            ]
          ),
          borderRadius: BorderRadius.circular(80),
        ),
      ),
    );
    
    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          top: -100,
          left: 20,
          child: bgBox,
        )
      ],
    );
  }

  Widget _titles() {
    final titleStyle = TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
    final subtitleStyle = TextStyle(color: Colors.white, fontSize: 18);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify transaction', style: titleStyle),
            SizedBox(height: 10),
            Text('Classify this transaction into particular category', style: subtitleStyle),
          ],
        ),
      ),
    );
  }

  Widget _menuButtons() {

    return Table(
      children: [
        TableRow(
          children: [
            _roundedBtn(Colors.lightBlue, Icons.widgets, 'General'),
            _roundedBtn(Colors.deepPurpleAccent, Icons.directions_bus, 'Transport'),
          ]
        ),
        TableRow(
          children: [
            _roundedBtn(Colors.pinkAccent, Icons.shopping_basket, 'Shopping'),
            _roundedBtn(Colors.deepOrangeAccent, Icons.credit_card, 'Bills'),
          ]
        ),
        TableRow(
          children: [
            _roundedBtn(Colors.blueAccent, Icons.movie, 'Entertainment'),
            _roundedBtn(Colors.lightGreen, Icons.local_grocery_store, 'Grocery'),
          ]
        ),
        TableRow(
          children: [
            _roundedBtn(Colors.red, Icons.collections, 'Photos'),
            _roundedBtn(Colors.teal, Icons.help_outline, 'FAQ'),
          ]
        ),
      ],
    );
  }

  Widget _roundedBtn( Color color, IconData icono, String texto ) {
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox( height: 5.0 ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon( icono, color: Colors.white, size: 30.0 ),
              ),
              Text( texto , style: TextStyle( color: color )),
              SizedBox( height: 5.0 )
            ],
          ),
        ),
      ),
    );
  }

}