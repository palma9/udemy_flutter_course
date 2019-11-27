import 'package:e5_qrscanner/src/models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class ViewmapPage extends StatefulWidget {

  @override
  _ViewmapPageState createState() => _ViewmapPageState();
}

class _ViewmapPageState extends State<ViewmapPage> {
  final mapController = new MapController();

  String mapType = 'streets';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coords QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () => mapController.move(scan.getLatLng(), 15),
          ),
        ],
      ),
      body: _createMap(scan),
      floatingActionButton: _changeMapLayer(context),
    );
  }

  Widget _createMap(ScanModel scan) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      layers: [
        _createMapLayer(),
        _createMarkers(scan),
      ],
    );
  }

  TileLayerOptions _createMapLayer() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
        '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoiZmx1dHRlci1kZXZlbG9wZXIiLCJhIjoiY2szaDZiYWw2MDhsZzNjcXBvYmRjanRhaCJ9.2obuwaRRFPdusH1rNjVBNQ',
        'id': 'mapbox.$mapType'
      }
    );
  }

  MarkerLayerOptions _createMarkers(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker> [
        Marker(
          width: 100,
          height: 100,
          point: scan.getLatLng(),
          builder: (context) => Container(child: Icon(
                                                  Icons.location_on, 
                                                  size: 45, 
                                                  color: Theme.of(context).primaryColor
                                                  ))
        )
      ]
    );
  }

  FloatingActionButton _changeMapLayer(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.layers),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        if (mapType == 'streets') mapType = 'dark'; 
        else if (mapType == 'dark') mapType = 'light';
        else if (mapType == 'light') mapType = 'outdoors';
        else if (mapType == 'outdoors') mapType = 'satellite';
        else mapType = 'streets';

        setState(() {});
      },
    );
  }
}