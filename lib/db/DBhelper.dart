import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Databasehelper {
  /**
   * Name of the database
   */
  static final _dbname = "passwords.db";
  static final _databaseVersion = 1;

  /**
   * Table Name
   */
  static final _table = "passwordTable";

  /**
   * Columns in the database
   */
  static final idColumn = 'id';
  static final usernameColumn = 'username';
  static final platformColumn = 'platform';
  static final passwordColumn = 'password';
  static final emailColumn = 'email';

  /**
   * Database variable ( coming from the sqflite class )
   */

  Database _database;

  /**
   * This line of code will prevent creating multiple instance of the class
   */
  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  /// getter function to get the database
  Future<Database> get database async {
    if (_database != null) return _database;

    /** if the database is not available create one database and initialize it */
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,
        _dbname); // database name joined with the file path

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _createDB);
  }

  /**
   * Function to create table / database 
   */
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_table (
        $idColumn INTEGER PRIMARY KEY,
        $platformColumn TEXT NOT NULL,
        $usernameColumn TEXT NOT NULL,
        $emailColumn EMAIL NOT NULL,
        $passwordColumn TEXT NOT NULL
      )
      ''');
  }

  /**
   * Function to Insert into the database
   */

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_table, row);
  }

  /**
   * Function to show all the data inserted into the database
   */
  Future<List<Map<String, dynamic>>> query_all() async {
    Database db = await instance.database;
    return await db.query(_table);
  }
}
