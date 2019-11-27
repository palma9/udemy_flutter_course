import 'dart:async';

import 'package:e5_qrscanner/src/models/scan_model.dart';


class Validators {

  final validateGeo = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      final geoScans = scans.where((s) => s.type == 'geo').toList();
      sink.add(geoScans);
    }
  );

    final validateHTTP = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      final geoScans = scans.where((s) => s.type == 'http').toList();
      sink.add(geoScans);
    }
  );

}