import 'dart:ffi';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/model/scan.dart';
export 'package:qr_reader/model/scan.dart';

import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'scans.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE scans(
      id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
      )
      ''');
    });
  }

  newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;
    final db = await database;

    final res = await db?.rawInsert('''
    INSERT INTO scans(id,tipo,valor)
    VALUES($id,$tipo,$valor)
''');
    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db!.insert("scans", newScan.toJsonInsertDB());

    return res;
  }

  Future<int> countScan() async {
    final db = await database;
    final data = await db!.rawQuery(" SELECT COUNT(*) FROM scans");
    final res = data.first["COUNT(*)"] as int;

    return res;
  }

  Future<void> insertScan(ScanModel scan) async {
    final db = await database;
    final res = await db!.insert("scans", scan.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> getScanById(int id) async {
    final db = await database;
    final res = await db!.query("scans", where: "id=?", whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<dynamic>> getAllScans() async {
    final db = await database;
    final data = await db!.query("scans");
    final res = data.isNotEmpty
        ? data.map((element) => ScanModel.fromJson(element)).toList()
        : [];
    return res;
  }

  Future<List<dynamic>> getFromType(String tipo) async {
    final db = await database;
    final data = await db!.rawQuery('SELECT * FROM scans WHERE tipo="$tipo"');

    final res = data.isNotEmpty
        ? data.map((element) => ScanModel.fromJson(element)).toList()
        : [];
    return res;
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final data = await db
        ?.update("scans", scan.toJson(), where: 'id=?', whereArgs: [scan.id]);
    return data as int;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db!.delete("scans", where: "id=?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db!.delete("scans");
    return res;
  }
}
