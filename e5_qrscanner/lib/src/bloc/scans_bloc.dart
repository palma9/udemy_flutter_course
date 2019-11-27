import 'dart:async';

import 'package:e5_qrscanner/src/bloc/validator.dart';
import 'package:e5_qrscanner/src/providers/db_provider.dart';
export 'package:e5_qrscanner/src/providers/db_provider.dart';

class ScansBloc with Validators {
  
  static final ScansBloc _singleton = new ScansBloc._();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._() {
    getScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validateGeo);
  Stream<List<ScanModel>> get scansStreamHTTP => _scansController.stream.transform(validateHTTP);
  
 
  dispose() => _scansController?.close();

  getScans() async => _scansController.sink.add(await DBProvider.db.getAllScans());

  addScan(ScanModel newScan) async {
    await DBProvider.db.newScan(newScan);
    getScans();
  }

  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    getScans();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAll();
    getScans();
  }



}