import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}


class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  
  double _width = 50;
  double _height = 50;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.fastLinearToSlowEaseIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ), 
        ),        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () => _changeProps(),
      ),
    );
  }

  void _changeProps() {
    final rng = new Random();
    
    setState(() {
      _width  = rng.nextInt(300).toDouble();
      _height = rng.nextInt(300).toDouble();
      _color = Color.fromRGBO(rng.nextInt(255), rng.nextInt(255), rng.nextInt(255), rng.nextDouble());
      _borderRadius = BorderRadius.circular(rng.nextInt(100).toDouble());
    });
    
  }
}