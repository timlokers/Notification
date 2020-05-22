import 'dart:io';

import 'package:notification/model/notification.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;
  static Database _database;

  String notificationTable = 'notification_table';
  String colId = 'id';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colTimestamp = 'timestamp';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notification.db';

    var notificationDatabase = await openDatabase(
        path, version: 1, onCreate: _createDatabase);
    return notificationDatabase;
  }

  void _createDatabase(Database database, int newVersion) async {
    await database.execute(
        'CREATE TABLE $notificationTable($colId INTEGER, $colDescription TEXT, $colPriority TEXT, $colTimestamp TEXT)');
  }

  Future<int> insertNotification(Notifications notifications) async {
    Database database = await this.database;
    try {
      var result = await database.insert(
          notificationTable, notifications.toMap());
      return result;
    }
    on Exception catch(e){
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ');
      print(e);
    }
  }

  Future<int> getCount() async {
    Database database = await this.database;
    List<Map<String, dynamic>> x = await database.rawQuery(
        'SELECT COUNT (*) from $notificationTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Map<String, dynamic>>> getNotificationMapList() async{
    Database database = await this.database;

    var result = await database.query(notificationTable);
    return result;
  }

  Future<List<Notifications>> getNotificationsList() async {
    var notificationMapList = await getNotificationMapList();
    int count = notificationMapList.length;
    
    List<Notifications> notificationList = List<Notifications>();
    
    for(int i = 0; i < count; i++){
      notificationList.add(Notifications.fromMapObject(notificationMapList[i]));
    }
    return notificationList;
  }
}