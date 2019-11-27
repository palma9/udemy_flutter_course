import 'package:flutter/material.dart';

import 'package:e5_qrscanner/src/bloc/scans_bloc.dart';
import 'package:e5_qrscanner/src/utils/launch_url.dart' as utils;


class MapsPage extends StatelessWidget {

  final ScansBloc scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {

    scansBloc.getScans();

    return StreamBuilder<List<ScanModel>> (
      stream: scansBloc.scansStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final scans = snapshot.data;
        
        if (scans.length == 0) {
          return Center(child: Text("There's no info"));
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.redAccent),
            onDismissed: (direction) => scansBloc.deleteScan(scans[i].id),
            child: ListTile(
              leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
              title: Text(scans[i].value),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey ),
              onTap: () => utils.launchURL(context, scans[i]),
            ),
          ),
        );
      },
    );
  }
}