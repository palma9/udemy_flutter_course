import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class ScanModel {
    int id;
    String type;
    String value;

    ScanModel({
        this.id,
        this.type,
        this.value,
    }) {
      if (this.value.contains('http')) {
        this.type = 'http';
      } else if (this.value.contains('geo')) {
        this.type = 'geo';
      }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id    : json["id"],
        type  : json["type"],
        value : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id"    : id,
        "type"  : type,
        "value" : value,
    };

    LatLng getLatLng() {
      final lalo = value.substring(4).split(',');
      final lat = double.parse(lalo[0]);
      final lng = double.parse(lalo[1]);

      return LatLng(lat,lng);

    }

    Icon scansLeadingIcon (BuildContext context) {
      IconData icon = Icons.cloud;
      if (type == 'http') icon = Icons.http;
      return Icon(icon, color: Theme.of(context).primaryColor);
    }
}
