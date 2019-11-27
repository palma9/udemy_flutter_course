import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:e5_qrscanner/src/models/scan_model.dart';
export 'package:e5_qrscanner/src/models/scan_model.dart';


class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    
    _database = await initDB();
  
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'QRScanner.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Scans('
          ' id INTEGER PRIMARY KEY,'
          ' type TEXT,'
          ' value TEXT'
          ')'
        );
      }
    );
  }

  // GET
  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');  
    return res.isNotEmpty ? res.map((sc) => ScanModel.fromJson(sc)).toList() : [];
  }

  Future<List<ScanModel>> getAllTypeScans(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'type = ?', whereArgs: [type]);  
    return res.isNotEmpty ? res.map((sc) => ScanModel.fromJson(sc)).toList() : [];
  }

  Future<ScanModel> getScan(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);  
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  // POST
  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    return await db.insert('Scans', newScan.toJson());
  } 

  // PUT
  Future<int> updateScans(ScanModel newScan) async {
    final db = await database;
    return await db.update('Scans', newScan.toJson(), where: 'id = ?', whereArgs: [newScan.id]);
  }

  // DELETE
  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete('Scans');  
  }
  
  Future<int> deleteScan(int id) async {
    final db = await database;
    return await db.delete('Scans', where: 'id = ?', whereArgs: [id]);  
  }

  
}