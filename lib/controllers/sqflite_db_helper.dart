// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart';
// should install these
// refer description for more
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// the database helper class
class Databasehelper {
  // database name
  static const _databasename = "health.db";
  static const _databaseversion = 1;

  // the table name
  static const table = "medicinedatabase";

  // column names
  static const columnID = 'id';
  static const columnMedicineName = "medicineName";
  static const columnMedicinePrice = "medicinePrice";
  static const columnQuantity = "quantity";
  static const columnNote = "note";
  static const columnCritical = "critical";

  // a database
  late Database _database;

  // privateconstructor
  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  // asking for a database
  Future<Database> get databse async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  // function to return a database
  _initDatabase() async {
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  // create a database since it doesn't exist
  Future _onCreate(Database db, int version) async {
    // sql code
    await db.execute('''
      CREATE TABLE $table (
        $columnID INTEGER PRIMARY KEY,

        //all medicine data

        
        $columnMedicineName TEXT NOT NULL,
        $columnMedicinePrice INTEGER NOT NULL,
        $columnQuantity INTEGER NOT NULL,
        $columnNote TEXT NOT NULL,
        $columnCritical INTEGER NOT NULL,
        );
      ''');
  }

  // functions to insert data
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.databse;
    return await db.insert(table, row);
  }

  // function to query all the rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.databse;
    return await db.query(table);
  }

  // function to delete some data
  Future<int> deletedata(int id) async {
    Database db = await instance.databse;
    var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
    return res;
  }
}
