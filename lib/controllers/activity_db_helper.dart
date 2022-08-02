import 'package:medi_app/models/activity_model.dart';
import 'package:sqflite/sqflite.dart';

const _DATABASENAME = "activity.db";
const _TABLENAME = "Activity";
const _VERSION = 1;

class ActivityHelper {
  Future<Database> initializeDatabase() async {
    var mydb = openDatabase(_DATABASENAME,
        version: _VERSION, onCreate: _createDatabase);
    return mydb;
  }

  void _createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_TABLENAME(id INTEGER PRIMARY KEY, walking INTEGER, sleeping INTEGER, heartRate INTEGER, waterConsumed DOUBLE)");
  }

  Future<int> insertIntoDb(Activity activity) async {
    final Database db = await initializeDatabase();
    return db.insert(_TABLENAME, activity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List> getAllActivity() async {
    final Database db = await initializeDatabase();
    var data = await db.query(_TABLENAME, orderBy: 'id');
    return data.toList();
  }

  Future<Activity?> getActivityById(int id) async {
    final Database db = await initializeDatabase();
    var did = await _getIdLogic(id, db);
    var data = await db.rawQuery("SELECT * FROM $_TABLENAME WHERE id = $did");
    // var data = await db.query(_TABLENAME, where: "id=?", whereArgs: [id]);
    if (data.isEmpty) return null;
    return Activity.fromMap(data.first);
  }

  Future<int> deleteActivityById(int id) async {
    final Database db = await initializeDatabase();
    var did = await _getIdLogic(id, db);
    var data = await db.delete(_TABLENAME, where: "id=?", whereArgs: [did]);
    return data;
  }

  Future<int> deleteAllActivity() async {
    final Database db = await initializeDatabase();
    var data = await db.rawDelete("DELETE FROM $_TABLENAME");
    return data;
  }

  Future<int> updateActivity(Activity activity) async {
    final Database db = await initializeDatabase();
    var data = await db.update(_TABLENAME, activity.toMap(),
        where: "id=?",
        whereArgs: [await _getIdLogic(activity.id!, db)],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return data;
  }

  Future<int>? _getIdLogic(int id, Database db)async{
    var data = await getAllActivity();
    for(int i = 0; i < data.length; i++){
      if(id == i+1){
        return data[i]['id'];
      }
    }
    return 0;
  }

}
