import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = ScrollController();

  List<int> _numList = List<int>();
  int _lastItem = 0;

  @override
  void initState() { 
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _addImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: _makeList(),
    );
  }

  Widget _makeList() {
    return RefreshIndicator(
      onRefresh: _refreshList,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(0),
        itemCount: _numList.length,
        itemBuilder: (context, index) {
          final img = _numList[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$img'),
            placeholder: AssetImage('data/img/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<void> _refreshList() {
    final duration = new Duration(seconds: 2);
    final rnd = new Random();

    new Timer(duration, () {
      _numList.clear();
      _lastItem = rnd.nextInt(1000);
      _addImages();
    });

    return Future.delayed(duration);
  }

  void _addImages() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _numList.add(_lastItem);
    }
    setState(() {});
  }
}