import 'dart:io';

import 'package:flutter/material.dart';

import 'package:e5_qrscanner/src/bloc/scans_bloc.dart';
import 'package:e5_qrscanner/src/pages/maps_page.dart';
import 'package:e5_qrscanner/src/pages/sites_page.dart';
import 'package:e5_qrscanner/src/utils/launch_url.dart' as utils;
import 'package:qrcode_reader/qrcode_reader.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();  
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRScanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => scansBloc.deleteAllScans(),
          )
        ],
      ),
      body: _callPage(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
        BottomNavigationBarItem(icon: Icon(Icons.language), title: Text('Sites')),
      ],
    );
  }

  Widget _callPage() {
    switch (currentIndex) {
      case 0:   return MapsPage();
      case 1:   return SitesPage();
      default:  return MapsPage();
    }
  }

  _scanQR(BuildContext context) async {

    String futureString;

    try {
      futureString = await new QRCodeReader().scan();
    } catch (e) {}

    if (futureString != null) {
      print(futureString);
      print(futureString);
      print(futureString);
      print(futureString);
      print(futureString);
      final newScan = ScanModel(value: futureString);
      scansBloc.addScan(newScan);

      if (Platform.isIOS) await Future.delayed(Duration(microseconds: 750));
      
      utils.launchURL(context, newScan);
    }

  }
}