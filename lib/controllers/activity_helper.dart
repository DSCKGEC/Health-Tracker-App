import 'package:medi_app/models/activity_model.dart';
import 'package:sqflite/sqflite.dart';

// create private constants that the database helper class will be using
const _DATABASENAME = "activity.db";
const _TABLENAME = "Activity";
const _VERSION = 1;

class ActivityHelper {
  // INITIALIZE THE DATABASE`
  Future<Database> initializeDatabase() async {
    var mydb = openDatabase(_DATABASENAME,
        version: _VERSION, onCreate: _createDatabase);
    return mydb;
  }

  // private function to create the database table
  void _createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_TABLENAME(id INTEGER PRIMARY KEY, walking INTEGER, sleeping INTEGER, heartRate INTEGER, waterConsumed DOUBLE)");
  }

  // add data into the database using the Activity class
  Future<int> insertIntoDb(Activity activity) async {
    // initialize database
    final Database db = await initializeDatabase();
    // return the success of inserting in to the database
    // zero means error;
    return db.insert(_TABLENAME, activity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // get al the data in the database in list format
  Future<List> getAllActivity() async {
    // initialize database
    final Database db = await initializeDatabase();
    // query the database
    var data = await db.query(_TABLENAME, orderBy: 'id');
    // convert to list and return
    return data.toList();
  }

  // get the activity by the id provided
  Future<Activity?> getActivityById(int id) async {
    final Database db = await initializeDatabase();
    var did = await _getIdLogic(id, db);
    var data = await db.rawQuery("SELECT * FROM $_TABLENAME WHERE id = $did");
    if (data.isEmpty) return null;
    // return the first data in the list provided by the query
    // and convert it to Activity class
    return Activity.fromMap(data.first);
  }

  // delete activity by id provided
  Future<int> deleteActivityById(int id) async {
    final Database db = await initializeDatabase();
    var did = await _getIdLogic(id, db);
    // delete data and return 1 if successful or 0 if error
    var data = await db.delete(_TABLENAME, where: "id=?", whereArgs: [did]);
    return data;
  }

  // delete all data in the table
  Future<int> deleteAllActivity() async {
    final Database db = await initializeDatabase();
    var data = await db.rawDelete("DELETE FROM $_TABLENAME");
    return data;
  }

  // update the data already in the database
  //  always provide the row position to the Activity so that the update knows which row to update
  Future<int> updateActivity(Activity activity) async {
    final Database db = await initializeDatabase();
    // update data and return 1 if successful or 0 if error
    var data = await db.update(_TABLENAME, activity.toMap(),
        where: "id=?",
        whereArgs: [await _getIdLogic(activity.id!, db)],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return data;
  }

  // This function prevent error when assessing row id in the database
  // you put the position the row is in the list and it returns the id so that
  // you can use it to access the data from the database
  Future<int>? _getIdLogic(int pos, Database db)async{
    var data = await getAllActivity();
    for(int i = 0; i < data.length; i++){
      if(pos == i+1){
        return data[i]['id'];
      }
    }
    // it returns 0, meaning there is no data
    return 0;
  }

}
