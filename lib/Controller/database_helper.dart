import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todos.db';
    var todosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE NOTIFICATIONS (Id INTEGER, Description TEXT, Priority TEXT, Timestamp TEXT)');
  }
}
