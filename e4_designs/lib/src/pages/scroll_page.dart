import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _firstPage(),
          _secondPage(context),
        ],
      )
    );
  }

  Widget _firstPage() {
    return Stack(
      children: <Widget>[
        _fpBackground(),
        _fpContent(),
        
      ],
    );
  }

  Widget _fpBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1),
      child: Image.asset('assets/img/scroll-1.png', fit: BoxFit.cover),
      
    );
  }

  Widget _fpContent() {
    final textStyle = TextStyle(color: Colors.white, fontSize: 50);
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 75),
          Text('11º', style: textStyle),
          Text(_weekdayText(), style: textStyle),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 90, color: Colors.white),
        ],
      ),
    );
  }

  Widget _secondPage(BuildContext context) {
    return Stack(
      children: <Widget>[
        _spBackground(),
        _spContent(context),
      ],
    );
  }

  Widget _spBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1),
    );
  }

  Widget _spContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        _spButton(context, 'Basic Page', 'basic'),
        SizedBox(height: 50),
        _spButton(context, 'Menu Page', 'menu'),
        Expanded(child: Container())
      ],
    ); 
  }

  Widget _spButton(BuildContext context, String text, String route) {
    return RaisedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
      shape: StadiumBorder(),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, route),
    );
  }

  String _weekdayText() {
    final _date = new DateTime.now();
    switch (_date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }

}