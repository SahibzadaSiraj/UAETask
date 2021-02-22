import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "envotech.db";
  static final _databaseVersion = 1;


  // user table
  static final table = 'User';
  static final myID = 'id';
  static final fullName = 'fullName';
  static final lastName = 'lastName';
  static final email = 'email';
  static final phone = 'phone';
  static final password = 'password';
  static final address = 'address';
  static final dob = 'dob';
  static final gender = 'gender';


  // address table
  static final addressTable = 'Address';
  static final addressId = 'addressId';
  static final addressData = 'address';

  // address table
  static final phoneTable = 'Phone';
  static final phoneId = 'phoneId';
  static final phoneData = 'PhoneData';







  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print("data base initialized");
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $myID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $fullName INTEGER,
            $lastName TEXT NOT NULL,
            $email TEXT NOT NULL,
            $phone TEXT NOT NULL,
            $password TEXT NOT NULL,
            $address DOUBLE NOT NULL,
            $dob TEXT NOT NULL,
            $gender TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $addressTable (
            $addressId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $addressData TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $phoneTable (
            $phoneId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $phoneData TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row,String tableName) async {
    Database db = await instance.database;
    var data = await db.insert(tableName, row);
    return data;
  }


  Future<List<Map<String, dynamic>>> queryAllRows({String tableName}) async {
    Database db = await instance.database;
    List<Map<String,dynamic>> data= await db.query(tableName);
    return data;
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    var count= Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
    return count;
  }

  Future<List<Map<String,dynamic>>> singleUser(String emailId) async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $table where $email = ?',[emailId]);
  }


  Future<int> update(Map<String, dynamic> row,int myId) async {
    Database db = await instance.database;

    var data= await db.update(table, row, where: '$myID = ?', whereArgs: [myId]);

    return data;

  }


  Future<int> delete(int id) async {
    Database db = await instance.database;
    var data= await db.delete(table, where: '$myID = ?', whereArgs: [id]);

    return data;


  }

  deleteAll(String table) async {
    Database db = await instance.database;
    db.delete(table);
//    db.close();
  }
}


var dbHelper = DatabaseHelper.instance;